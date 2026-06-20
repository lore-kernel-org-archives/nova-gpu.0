Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8692DF6C;
	Sat, 20 Jun 2026 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781955050; cv=none; b=dVOyG420MeV3nnZvO2pqx4oVlfIHi7eiifEj1wrCq9XdIuTT2Yc/yfXiEJdQTGq4+4KZVYHO1MwyZb/NBGVgfdjgqq8iiBKxqrynS/itdEHf3IR9D4dek76iW2rHFOJqHKgAjpqNYK+2jhu3r1U5pOJB3HA1LdieG/6iqp1i+D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781955050; c=relaxed/simple;
	bh=RN/g5q/1deEE1g7ufOo6MdcXiKip618BOGyn8m8CMK4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=ED/4RMbVDhXLJyQ88vza3cxvJqQITmDwTl/QY/Xs8cxr5Gz4zfJMyPL1W/SHQwYWoyOFLfhXzJgsRLsWmrO7cfb6AGDXJpUZRqSph9w8/oG9iL+1j6gd+G8RtiNHL+A4YqZXxt+MfrWNmROH75LRWNl8YhufNY6gl/ADUzNQIGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QiroeYfC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QiroeYfC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7E91F000E9;
	Sat, 20 Jun 2026 11:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781955049;
	bh=EH+Um+Qh9d/qm5Ekr4h7boqJBdnm9jaLYT6h4CVUUZo=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=QiroeYfCPXnXr4ZGETMecj03X+Cl4/fNxMR6bk46XGoaLNaisI3Gi7TLWbhnIYxfU
	 qBke0ifdpjPLNDj/+O+dS5mEOXlAhpLXOLYNIT2ud9fXnYtytHMj7zKZYplp2KpeUg
	 q3HA8mpFI2ufLU0Avn4aa8nGK+bi5OzB2pnP6U8SpFLLN703nG8UatbwDzJOK8Sy7w
	 X8t5ESlM+DDzIhRJV62cnHUB4uFxpTYPpmyMAnFG8ZF7Yz67Lbkr2wzi7aMQcmkio5
	 QJ3p7474knia6t93mK6yFFOuA79jUUDYnUr49Ce4+pOsW6/yvS10r4b2JALWUa5y1w
	 aq4xCkW/lsMvw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 20 Jun 2026 13:30:46 +0200
Message-Id: <DJDUCF0FN8M3.OKSUDWCKJ4PR@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 3/3] gpu: nova-core: gsp: Extract and display usable
 FB regions from GSP
References: <20260617-boot-vram-v3-0-20b9ec5fe9f2@nvidia.com>
 <20260617-boot-vram-v3-3-20b9ec5fe9f2@nvidia.com>
In-Reply-To: <20260617-boot-vram-v3-3-20b9ec5fe9f2@nvidia.com>

On Wed Jun 17, 2026 at 3:24 PM CEST, Alexandre Courbot wrote:
> @@ -377,6 +378,21 @@ pub(crate) fn new(
>                      Err(e) =3D> dev_warn!(pdev, "GPU name unavailable: {=
:?}\n", e),
>                  }
> =20
> +                if !info.usable_fb_regions.is_empty() {
> +                    dev_info!(pdev, "Usable FB regions:\n");
> +                    for region in &info.usable_fb_regions {
> +                        dev_info!(pdev, "  - {:#x?}\n", region);
> +                    }
> +
> +                    dev_info!(
> +                        pdev,
> +                        "Total usable VRAM: {} MiB\n",
> +                        info.usable_fb_regions.iter().fold(0u64, |res, r=
egion| res
> +                            .saturating_add(region.end - region.start))
> +                            / u64::SZ_1M
> +                    );
> +                }

Drivers should generally remain silent when they work properly, some except=
ions
are fine, but this seems too verbose. Let's use dev_dbg!() instead.

Also, would it make sense to (rather) warn in the else case? (I think OpenR=
M
treats this as error, although the check in OpenRM checks whether there are=
 no
regions at all.)
