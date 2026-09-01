Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8084C3AAF40;
	Tue,  1 Sep 2026 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246888; cv=none; b=YGi7/+l2YuwXuLhckhPc/P0ngz3CnAkHAwBIJR4QnPwhOD64+h6k9PiZVkTwOznj/M9JRDM1FsNB345OaQLAyNPVvkREHnJrWYXkHppM2dp0cLHCWJn4ecvzud6iKrKeKPWVfK7Ja9OF2JfCZSgl+F3l/GeiDAohGMLEQ3T08/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246888; c=relaxed/simple;
	bh=wm+wr2IiqvIz2lN61nMadWtH+SCi3eBdkmKQrsVKxes=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Tb3txuB9uCAjsFFAZaW3/4vhxgpeE05akoNox7O8ZWB0w3xPgrBJPxm75pNSwayn2/QLU3tQiXI5cbQZR5cC9QgGDKYXAN92qWSwol+XWv2uQxDTRBZpxMz165wDky2/wwMQFSyvcu4Ed60lQnHeK9VUH/jrF4RdF3sQnbmFNys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkotNaaa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkotNaaa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751661F000E9;
	Tue,  1 Sep 2026 07:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788246887;
	bh=csvN5GSqwoccEzKPLJkQqPjKtkOmR9U06eZT6ErQyno=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=SkotNaaaR58M5GRfj8W3joxlrYWoUOec3KjnFycxmTzbeH0IzA/8+4YSw4Fr/vlaN
	 j8I51KXUrLjCNXGgqGUTdjVlScFozM5/06gzTGtCGspWqHRHIVGyRY3vs54KmjzEiE
	 LJsRkGsX+fYp854p7fbuGS6RtO9b3p3HO51PQvSywttTkV6QQAds8VdtThP9AylczH
	 5n/gluFvhwLVydSSVGePyQjGzFXTpFfZzBaE/G3vYizze5aN7qxZbFPOGuKWBtfZ9r
	 TG4eeCVQhnR71k2YI7IpAFIvAA7u41MzHBBXmc067qBrqGb5uHi1nkg1L+3BQSt3Yh
	 nfXU8Cc0k0BBg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 09:14:42 +0200
Message-Id: <DL3SM4UA1QC5.3KA2M1DE6F0F7@kernel.org>
Subject: Re: [PATCH v5 01/11] gpu: nova-core: Add public driver API to
 nova-core
Cc: "Gary Guo" <gary@garyguo.net>, "nova-gpu" <nova-gpu@lists.linux.dev>, "M
 Henning" <mhenning@darkrefraction.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Benno Lossin" <lossin@kernel.org>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260828033531.1117754-1-apopple@nvidia.com>
 <20260828033531.1117754-2-apopple@nvidia.com>
 <DL3EGE1IY4FL.3X49WKCS67UT@kernel.org>
 <DL3F6EKL2F6Z.2DRXPQLYLE7FM@garyguo.net>
 <apZ3_o8hxlMr6SoP@nvdebian.thelocal>
In-Reply-To: <apZ3_o8hxlMr6SoP@nvdebian.thelocal>

On Tue Sep 1, 2026 at 9:07 AM CEST, Alistair Popple wrote:
> On 2026-09-01 at 06:42 +1000, Gary Guo <gary@garyguo.net> wrote...
>> On Mon Aug 31, 2026 at 9:08 PM BST, Danilo Krummrich wrote:
>> > On Fri Aug 28, 2026 at 5:35 AM CEST, Alistair Popple wrote:
>> >> +/// API handle for the auxiliary bus child drivers to interact with =
nova-core.
>> >> +pub struct NovaCoreApi<'bound> {
>> >> +    #[expect(unused)]
>> >> +    pub(crate) gpu: Pin<&'bound Gpu<'bound>>,
>> >> +}
>> >> +
>> >> +impl NovaCoreApi<'_> {
>> >> +    /// Obtain a [`NovaCoreApi`] handle from an auxiliary device reg=
istered
>> >> +    /// by nova-core.
>> >> +    pub fn of(adev: &auxiliary::Device<Bound>) -> Result<Pin<&NovaCo=
reApi<'_>>> {
>> >> +        adev.registration_data::<CovariantForLt!(NovaCoreApi<'_>)>()
>> >> +    }
>> >> +}
>> >
>> > CovariantForLt does not hold anymore on latest drm-rust-next, as Cmdq =
has a
>> > Mutex. So, this needs ForLt now and therefore the approach that I shar=
ed in [1]
>> > a while ago. I applied the changes in [2] to fix it up.
>
> I can see why the mutex means covariance no longer holds, but I would kin=
d
> of also expect it to not compile given it surely can't be safe here to tr=
eat
> an invariant type as covariant. Is this just a limitation of the current
> CovariantForLt implementation not being able to prove covariance or am I =
missing
> something else? Thanks.

Well, it did not compile (as expected) on my end, which is how I caught it.
What's your base revision?
