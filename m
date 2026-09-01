Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EBD4756A7;
	Tue,  1 Sep 2026 10:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259091; cv=none; b=HfkUpHyO4yVQgHLbQHSJFVl702FM7N3ySeCDtfCz7zdUoLO/pyFazwk39agZpBePKjyJRSQoJImBXgCE8IQYksLeIk8HvAML7MbkX+b0pN4teCWO4Iuhax/u68AR1SvsAwtPVoMTC83Uch+drz2PwgavPmEzMG1HtrqAx837kdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259091; c=relaxed/simple;
	bh=vxwQzb90PL87MHnJgsffQM9Q4e1yOdzZk8RTcdF0RnU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ifXVgM7PUKcrsAece88VAJoz1X4mEwnL8jaiRnFvw4WVPOldf4akSTX+xPaoI6yzsGkAoA491Bq90PrFQwULaKBlrXioRIxTHVxMkPTG/OSmxU359qyfHdSJtWfA8ZPedH1u01tegL7Hkds1W2PG9aY9MgXR2dp2dr/g3HgwiQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bogF0Ihn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bogF0Ihn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1871F000E9;
	Tue,  1 Sep 2026 10:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788259089;
	bh=qFJY0pjzSwJGrf4DiDAornj+7D/YJC8lZnDr3qLCuM0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=bogF0IhnyvO3hnJ6AcOK6H4okCsMwMcXXA+vQGLrdE0Nz0gsM5uBXy98zloY8nh7S
	 NXiI7Jbp6vXQTct3NRBJXcaj9EJsy3pNb+LZK6qObxP/CjRsMX+3g796WvASdbVTL/
	 9/kGP6aeeW4H3h+sF+L0xpcf1GJsuS0/1DSUK0rU6mImTYnXdbH8yTbXOTTYfz8wop
	 5/TPreRKgbyD1EdfRvHF7TsEEYYz/ORngBy6/chcdSyvPSwkCgNXq3OTOzbJiH41Uf
	 U81qKFhqD/KCHRvgJ1Sqap+HdVkKlJNeQl1VnvSFbnY04r8ICqIB3xcYpR3ORVwYYa
	 e/cjsLcB3KvkQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 12:38:05 +0200
Message-Id: <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
Cc: "nova-gpu" <nova-gpu@lists.linux.dev>, "M Henning"
 <mhenning@darkrefraction.com>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260828033531.1117754-1-apopple@nvidia.com>
 <20260828033531.1117754-6-apopple@nvidia.com>
In-Reply-To: <20260828033531.1117754-6-apopple@nvidia.com>

On Fri Aug 28, 2026 at 5:35 AM CEST, Alistair Popple wrote:
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 0c12ef145981..740466af268d 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -138,6 +138,11 @@ pub(crate) const fn arch(self) -> Architecture {
>          }
>      }
> =20
> +    /// Returns the implementation identifier of this chipset.
> +    pub(crate) const fn implementation(self) -> u32 {
> +        self as u32 & 0xf
> +    }

I missed this part in my previous reply. Besides being a bit unfortunate th=
at we
have to reimplement what boot42.implementation() already gives us, I think =
the
value is not overly useful anyway.

I get the intent, architecture and implementation complement each other, bu=
t in
practice we are not interested in the implementation bits, but either in a
unique chip identifier or the architecture.

If you look at the nova-core code you will find exactly that, we either che=
ck
for a specific chip or an architecture and I think userspace will be inters=
ted
in the same.

So, I think the uAPI should provide the architecture and a unique chip
identifier.

Before we circle back, I know that the unique chip identifier in nova-core
technically contains the architecture for obvious reasons, but my point has
always been that we can give the decoded architecture to userspace and not
require it to know about and extract it from the chip identifier we conside=
r
opaque in the uAPI.
