Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B243D3B6C00;
	Tue,  1 Sep 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282095; cv=none; b=VhzFsFEFAo1Uf8X0cSumtHSXlsgmtPob8SlqjPSVUi7UVVFI8LOMD/EOJGfwHbnLlk3wOt8OhwPgpOZggl4eVBuBiMVTMjYV0O3s3swrhwg6AfKH/+YsOc9eWHzbMAoBh0Jzqn2G89obt4DPEdfB64yyIFxghinLC0FuKw0ptkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282095; c=relaxed/simple;
	bh=4gMocvSE1OWF6J9n/j4yFotrO6PAr/R3O4m97J9AAv0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ggt9irVCwqvcXS03oUigbXAPVKR00/YZNJg6Fvw5ALuDgcp6VIaVcsxClbmAGZNjDayDMFSF+YoAoBEk6NEvccVPbXHcHZEu8YtygOpoSMg9qFXOTBQ0MrT3Q6ZUZ0nB0crJDSQZc/xbdeF6guZScBuvnNFZ+jKwJp7psztSoLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtwoZVG1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtwoZVG1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85981F000E9;
	Tue,  1 Sep 2026 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282093;
	bh=LAeVXgd1ZimbqqP9kzNpwF8gqCcgGG9RZxEcTde5m04=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=QtwoZVG10cLUAhsuReDww1AXmS3HBsD4DnOexUNJfgxoLVIuaQApZ3v/xAMiuQG3x
	 f3ifO/cWU0dFt9xEbck0X6DBj8n5FXzk9sZAXoaMqflzHr3v7zoSOohCAqD4CQUPXn
	 BAD2Nu6gIJP7uzXxfFlyJ6AyVehjRqteQGtO7VLTQnNFUaeEHDrqJPpMjYT1Lt08/Y
	 pJW/4IxVGohE5wuHzrNe703hSy7kzbP34wEdfLdZjYv05cv88z41sjFHPTkuFsf+EN
	 CU9JhM4TMfDUnWPUAd78NXJKW/bpAzDHt63ZJZuiAuNtCkQ3A2ASYeOZsFzyaTHJu8
	 7WyJuhuECr6hQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 19:01:29 +0200
Message-Id: <DL453EFS03T6.2VGI5TJEQ52QO@kernel.org>
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
 <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org>
In-Reply-To: <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org>

On Tue Sep 1, 2026 at 12:38 PM CEST, Danilo Krummrich wrote:
> On Fri Aug 28, 2026 at 5:35 AM CEST, Alistair Popple wrote:
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 0c12ef145981..740466af268d 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -138,6 +138,11 @@ pub(crate) const fn arch(self) -> Architecture {
>>          }
>>      }
>> =20
>> +    /// Returns the implementation identifier of this chipset.
>> +    pub(crate) const fn implementation(self) -> u32 {
>> +        self as u32 & 0xf
>> +    }
>
> I missed this part in my previous reply. Besides being a bit unfortunate =
that we
> have to reimplement what boot42.implementation() already gives us, I thin=
k the
> value is not overly useful anyway.
>
> I get the intent, architecture and implementation complement each other, =
but in
> practice we are not interested in the implementation bits, but either in =
a
> unique chip identifier or the architecture.
>
> If you look at the nova-core code you will find exactly that, we either c=
heck
> for a specific chip or an architecture and I think userspace will be inte=
rsted
> in the same.
>
> So, I think the uAPI should provide the architecture and a unique chip
> identifier.
>
> Before we circle back, I know that the unique chip identifier in nova-cor=
e
> technically contains the architecture for obvious reasons, but my point h=
as
> always been that we can give the decoded architecture to userspace and no=
t
> require it to know about and extract it from the chip identifier we consi=
der
> opaque in the uAPI.

IOW, we should not think of this in terms of the numbers/values exposed by =
some
register. All the users (including nova-core itself) don't really care abou=
t the
values behind the enum, how it composes and how it is related to other valu=
es,
that's just an implementation detail.

All users care about is that they have an architecture and chip identifier =
to
compare against. I.e. there's no value letting userspace think of the chip
identifier as architecture/implementation tuple, since the implementation v=
alue
by itself is rather useless.
