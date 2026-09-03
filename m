Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D2B443AA8;
	Thu,  3 Sep 2026 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432136; cv=none; b=nmmWyTC6WW43n4OCWGYvYMZSgXtpRnPs5dnYNjYE4HhpjBklMHWMgBr3gsv1zDFeQVcyCfXtmapzidqv27/x2TV12ezPuktW5KY1IVsDcg2UNx2Y9f1NzXgIBi7RLa7wJZRT5RZlYTeT5v3feh4Jt5tLMNd6woIz1ygWwuM+xOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432136; c=relaxed/simple;
	bh=WfRQVOXm8kRHSGy+SFvTSKlMmOR1YE5b4wITqNsCIBM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=kYj1NXgeiLdRPaCphdUrSELOIpwrhZQ6LHu8E4o82uNyF0RIGkSJ9cDvNSeGhiI2oE8T3wRJVmxylkzfczXw+NewMDBT0UGfZE7NSVOB+9nNz7wLOCltqBsJArriwT5Fjpi2nu0DPxgDdcWMN22Bby6iS28MSJ/dh/I0awLjqe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hchOmgCG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hchOmgCG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2531F000E9;
	Thu,  3 Sep 2026 10:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788432134;
	bh=0lWKLgh9eROD9CpNagoMw/8kDXcGbqx0WiEENGbiO/0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=hchOmgCGObpETYFPP/wLKvhpGZiFBT2bB/hOOF5JYGlS9ZOv973UwtuYstyBn/COB
	 IGViO6+tgsHZANNtumAnQoCNeb6eTV7tD+aTtlrADeX/qSTHvTy8KR8FlmzGAJrQcx
	 TPYZc5OdkeCvldGfF167u9GLS3iAsSkfnAJSqphgq6X2CTjuMMszIV0Q8wLozXMZhC
	 rzY0wUwL3oymmarSxqH2R3ca/++bL9Z9sTAl2qOMAfZLHPoK4d7OgcTYIFPw1FKiwh
	 i3dkbmC1i56sS96tMeNdvYuxjJhuFTh/gs1mHHsuPXUsAmIQ4ygBGSgNXQoRq0xl8J
	 /+dlNcHeC10TA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 12:42:09 +0200
Message-Id: <DL5MA26KZEF9.3KHKQXZ4JD2G6@kernel.org>
Cc: "nova-gpu" <nova-gpu@lists.linux.dev>, "M Henning"
 <mhenning@darkrefraction.com>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
References: <20260828033531.1117754-1-apopple@nvidia.com>
 <20260828033531.1117754-6-apopple@nvidia.com>
 <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org>
 <DL453EFS03T6.2VGI5TJEQ52QO@kernel.org>
 <apdvTgAp5eGezO5t@nvdebian.thelocal>
 <DL4QCAZXM8EU.2K8MLAM00VNTX@kernel.org>
 <apioGUDamrCur_oR@nvdebian.thelocal>
In-Reply-To: <apioGUDamrCur_oR@nvdebian.thelocal>

On Thu Sep 3, 2026 at 3:12 AM CEST, Alistair Popple wrote:
> Originally I thought the point of providing the decoded arch rather than
> chip-id

I think there never was a "rather than". The point was that if userspace ha=
s
conditionals based on the architecture it shouldn't have to figure it out b=
ased
on the chipid, as this has been done by the kernel already.

> because as you rightfully point out the kernel doesn't (currently at leas=
t)
> care much about the implementation

I still don't see how that value will ever be meaningful, there is no such =
thing
as "all GPUs of a certain implementation regardless of architecture" have
something in common, is it?

But since you say "currently at least", are there any plans to give this va=
lue
some meaning beyond being a unique counter for chips within a certain
architecture?

If so, I think that'd be a horrible way to encode some chip commonality.

> But we agreed that wasn't desirable, so now I'm still left figuring out w=
hy we
> need to provide an arch value? The chip-id already entirely encapsulates =
the
> concept, so what can/should user-space use the arch value for?

Because userspace otherwise has to figure out the architecture itself based=
 on
the chipid, while the kernel already did derive this information.

There's many ways userspace could do this, and I don't want to incentivise =
any
of them.

For instance, you previously showed how userspace derives the SM value from=
 the
chipid with sm_for_chipset() in mesa with its own lookup table.

Then in NAK (src/nouveau/compiler/nak/ir.rs), there's this code.

	fn is_turing(&self) -> bool {
	    self.sm() >=3D 73 && self.sm() < 80
	}
=09
	fn is_ampere(&self) -> bool {
	    self.sm() >=3D 80 && self.sm() < 89
	}
=09
	fn is_ada(&self) -> bool {
	    self.sm() =3D=3D 89
	}
=09
	#[allow(dead_code)]
	fn is_hopper(&self) -> bool {
	    self.sm() >=3D 90 && self.sm() < 100
	}
=09
	fn is_blackwell_a(&self) -> bool {
	    self.sm() >=3D 100 && self.sm() < 110
	}
=09
	fn is_blackwell_b(&self) -> bool {
	    self.sm() >=3D 120 && self.sm() < 130
	}
=09
	fn is_blackwell(&self) -> bool {
	    self.is_blackwell_a() || self.is_blackwell_b()
	}

That's two unnecessary indirections for something the kernel already has
available.

> It really boils down to how much static config info we want to encode int=
o
> kernel lookup tables vs. user-space lookup tables. I don't this we should=
 be
> filling the kernel with a bunch of static struct lookups just to ship tho=
se
> struct definitions to user-space. It seems more reasonable to put that in
> user-space, unless of course the kernel needs it.
>
> So I think your "does the kernel need this" is a reasonable benchmark for
> deciding this.
>
> As I think you're hinting at it would be ideal if GSP or some other firmw=
are
> table could just provide everything in some nice static config table, but=
 I
> don't think that's currently possible and looking at other user-space dri=
vers
> we're certainly not alone there.

Yeah, although if SM is correctly reported by the GSP, I'd rather have it
exported in an info structure than have userspace create its own lookup tab=
le.
