Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9DF42088C;
	Mon,  6 Jul 2026 17:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360589; cv=none; b=Sp3FzEDjPJCDo6scDXYKw2OEH+PpQWDtvGzLPqkwT/MKFVTwtwHB/TNhr3dXGUNKL4tF/VyBrOu7s50L/+vcFImq3F8323OG6C2YdaaxeX+7riDeR9pNN9KzAKi4a4s5cDj33bkCVDDBug7c+uneUFE1hV5I+28k3q7VQDbDpKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360589; c=relaxed/simple;
	bh=4sJJaha7h91aNOht13zkLExWMQIdxFSKeN5/iS4YS98=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=oaODLyIx+x0CBCYq1pTD3lA2lZehIvxg9jvMIZcbHfKnrPOGoAEMOQ+d/nAoXchi1Fx5jGSxuY/PbvanOzA8v1Sh2oCNI2GohNTnn97p+E7SLWCQY784qquy/ROUNxR7OKI9V1rdxmqlPWKTVbZy0My/l+JLkXO6EtKOzl0J6i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4ffZg7a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4ffZg7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E351F00A3A;
	Mon,  6 Jul 2026 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360588;
	bh=3Y+/Y5CwYs10KXLLxmpqapZy45ZNjQ90GHLjO/6w3rs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=M4ffZg7awdC4io/+Ja+LjKF3KJudAwJL4q0LmJjxDLAFMS4moSWt8Qbkx52fvPxoS
	 gkqa3WZj62/6hgU596qKNI8H2a+Dk7hYUBvOZfhgbDI0LlPkNOcKuXhidu4oM9nhby
	 ev8mWwDmzhYpiPMcNIhPnuS4KIg39vGAEJFgf+NuN74dseIguALVBrLdh0D/qgq3Mf
	 +pkyX1K/SmlbFoIBKP8VcUSGMmJWL9QLQLqjX8N0l4fVSt7V9DkOGEpP9Ka7VsIg0a
	 EB/8/2VgNvdAL+wJi8T9IDsHoqIg4dRQlfFcweUvWzvgyvB3sft/0/R2c53zu0/pv0
	 fPoH0Cr0uV57A==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 19:56:24 +0200
Message-Id: <DJROKEFANC4J.1RLIKVEMS878W@kernel.org>
Subject: Re: [PATCH 1/4] gpu: nova-core: Add public driver API to nova-core
Cc: <nova-gpu@lists.linux.dev>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260706053413.154135-1-apopple@nvidia.com>
 <20260706053413.154135-2-apopple@nvidia.com>
In-Reply-To: <20260706053413.154135-2-apopple@nvidia.com>

On Mon Jul 6, 2026 at 7:34 AM CEST, Alistair Popple wrote:
> @@ -86,15 +90,34 @@ fn probe<'bound>(
>                  // (`try_pin_init!()` initializes fields in declaration =
order), lives at a pinned
>                  // stable address, and is dropped after `gpu` (struct fi=
eld drop order).
>                  gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar=
) }),
> -                _reg: auxiliary::Registration::new(
> -                    pdev.as_ref(),
> -                    c"nova-drm",
> -                    // TODO[XARR]: Use XArray or perhaps IDA for proper =
ID allocation/recycling. For
> -                    // now, use a simple atomic counter that never recyc=
les IDs.
> -                    AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
> -                    crate::MODULE_NAME,
> -                    (),
> -                )?,
> +
> +                // SAFETY:
> +                // - `NovaCore` is dropped when the device is unbound; i=
.e.
> +                //   `mem::forget()` is never called on it.
> +                // - `gpu` is initialized above, lives at a pinned stabl=
e
> +                //   address, and is dropped after `_reg` (struct field =
drop
> +                //   order).
> +                _reg: unsafe {
> +                    auxiliary::Registration::new_with_lt(
> +                        pdev.as_ref(),
> +                        c"nova-drm",
> +                        // TODO[XARR]: Use XArray or perhaps IDA for pro=
per ID allocation/recycling.
> +                        // For now, use a simple atomic counter that nev=
er recycles IDs.
> +                        AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
> +                        crate::MODULE_NAME,
> +                        NovaCoreApi {
> +                            // TODO: Use `&gpu` self-referential pin-ini=
t syntax once available.
> +                            //
> +                            // SAFETY: `gpu` is initialized before this =
expression is evaluated
> +                            // (`try_pin_init!()` initializes fields in =
declaration order), lives at
> +                            // a pinned stable address, and is dropped a=
fter `_reg` (struct field
> +                            // drop order).
> +                            gpu: Pin::new_unchecked(
> +                                &*core::ptr::from_ref(gpu.as_ref().get_r=
ef()),
> +                            ),

Hm...it's a bit messy to have this justified in two separate places. It wou=
ld be
better to have separate unsafe blocks for this until pin-init solves this
properly. So, let's just do this.

+                _reg: {
+                    // SAFETY: `gpu` is initialized before this expression=
 is evaluated
+                    // (`try_pin_init!()` initializes fields in declaratio=
n order), lives at
+                    // a pinned stable address, and is dropped after `_reg=
` (struct field
+                    // drop order).
+                    let gpu =3D unsafe {
+                        Pin::new_unchecked(
+                            &*core::ptr::from_ref(gpu.as_ref().get_ref()),
+                        )
+                    };
+
+                    // SAFETY: `NovaCore` is dropped when the device is un=
bound; i.e.
+                    // `mem::forget()` is never called on it.
+                    unsafe {
+                        auxiliary::Registration::new_with_lt(
+                            pdev.as_ref(),
+                            c"nova-drm",
+                            // TODO[XARR]: Use XArray or perhaps IDA for p=
roper ID allocation/recycling.
+                            // For now, use a simple atomic counter that n=
ever recycles IDs.
+                            AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
+                            crate::MODULE_NAME,
+                            NovaCoreApi { gpu },
+                        )?
+                    }
                 },
