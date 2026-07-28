Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980912F585;
	Tue, 28 Jul 2026 22:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785279480; cv=none; b=FaMXkxjfZK5n96mDLgRlsfCv6+z0wb/o/GhLSE4vwHNTsK6tCBtmdHALuuYVCr9pBYbaJPqRgCkUdRL4jRczlWjPmnI0oEq3qgq3CsAEp7xbga5razYMePz5WkFmsoTps/t+A+1QbRbY8eHIqNUNV+cDaZ2NMbht8VFvBP76YEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785279480; c=relaxed/simple;
	bh=NU4gQDORVsbUap6U0A9VmjHEKJHsO1XCOCgSpGx6vos=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=SlwvfCwP/lK6DMqDAVTGp+9GnvmV3U0nOKMSS4K88q2hvnoLAfpsWL7a+Bbg/NzjaUVPSbhd5+ogqygIMd3Vq1Y86VRXKijOdQCWp1EPJg1Nn66jnvZgpy12snj5so+UMU70aW5vgBMc0PTYU5WmjHWWxpf8nCPUpADZkrZU2mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImypsxfZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImypsxfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0251F000E9;
	Tue, 28 Jul 2026 22:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785279478;
	bh=Q5+bJVq2NtUHitRnBcOQ2qLuXZ52yMoJcvSTojTBjzo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=ImypsxfZw71LtTrY9CCzThSxefznXxQtb70tcCMyzxoggrdS3RbRbcS7gR3e5B7YD
	 Zzy/o2B1iKniiyOfjP0Mlukr9zKqvPn3r8yhjfHfx/vUtt2PwBeacPaEyKkEOOuBE6
	 xhi/8e/ZU2E2TiyWBoG0FjmaUWOFSFmuutugZtuyD8ICSxp4qRD0xncXe6iQBVpGZv
	 ExvzfXC3spdtTP+fcBPBGlEklHTDzg6y/rxFOkRT54rAHkJxYlQ0QmUNaxsnmYYkRf
	 YlJqfXxVGBUvQ5aoQOHEhdOl0xyXN8HLUGefABvWbbACc3Zdp6D7z35YKi4sBSSlR2
	 Yci/bgAW6eyVg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 00:57:54 +0200
Message-Id: <DKAKR85QX9UM.1VYAAL82QBWJ5@kernel.org>
Subject: Re: [PATCH v3 3/7] drm: nova: Add chipid enum to nova-drm UAPI
Cc: "Alistair Popple" <apopple@nvidia.com>, <nova-gpu@lists.linux.dev>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260723063046.1265791-1-apopple@nvidia.com>
 <20260723063046.1265791-4-apopple@nvidia.com>
 <DK7R7PB91GUE.1PS77AQM8ZR99@kernel.org>
 <amhdA35CcMD_uY2f@nvdebian.thelocal>
 <DKAIVPSA45O9.1NZES5S3BII10@kernel.org>
 <57e2b956-89fd-43e8-8cb3-a15aee272660@nvidia.com>
In-Reply-To: <57e2b956-89fd-43e8-8cb3-a15aee272660@nvidia.com>

On Tue Jul 28, 2026 at 11:49 PM CEST, John Hubbard wrote:
> On 7/28/26 2:29 PM, Danilo Krummrich wrote:
>> On Tue Jul 28, 2026 at 10:00 AM CEST, Alistair Popple wrote:
>>> On 2026-07-26 at 01:23 +1000, Danilo Krummrich <dakr@kernel.org> wrote.=
..
>>>> On Thu Jul 23, 2026 at 8:30 AM CEST, Alistair Popple wrote:
> ...
>>>> For instance, what's valid for userspace to extract from this? Given c=
hipid is a
>>>> composed value, is userspace e.g. allowed to make assumptions on extra=
cting the
>>>> architecture? Or is this something we want to expose separately and te=
ll
>>>> userspace that the chipid is an opaque value identifying a specific ch=
ip only?
>>>
>>> I _think_ it makes sense for this to just be an opaque value, but it's =
a good
>>> question that I should probably try and get some internal feedback on a=
s well.
>>> Reading the arch would then be a separate parameter.
>>=20
>> I'd prefer exposing it as an opaque value and provide other information
>> separately; the kernel already does the work anyway, so why duplicate it=
 in
>> userspace. It would also remain much cleaner if encoding details ever ch=
ange.
>>=20
>
> Just to orient myself, I'm assuming that by "opaque values", you mean usi=
ng
> something that just counts up from, say, 1, instead of using real boot42
> values below, right?
>
> That seems like a good approach to me, too. Because I can't imagine anyth=
ing
> particularly good coming from providing unnecessary details to user space
> here. :)

I'd probably not be too worried about keeping it as is, but just document i=
t as
being an opaque value that shouldn't be messed with.

If we expose the encoded information separately I don't see a huge incentiv=
e for
userspace to redo the work and mess with it anyway.

The advantage of keeping the values as they are is that we avoid having to =
deal
with mapping values back and forth. I kind of like that nova-core uses the
values from the uAPI header to define the Chipset struct, passes it to nova=
-drm
and nova-drm does use it to fill in the userspace exposed data.

Something else worth to consider in this context is whether we really want =
to go
with the key-value pair GETPARAM approach, which can become a bit tedious.

I think for the basic GPU information we could have a struct drm_nova_gpu_i=
nfo,
which contains all the relevant information obtained at probe time, such as
chipid, architecture, VRAM size, etc.

If everything is available in a single struct there should be no reason for
userspace to mess with the chipid value. However, I'd also not object to ma=
ke it
a "real" opaque value.

In order to deal with additions to the struct we could take a two stage app=
roach
to obtain the information from userspace; probe size first, then allocate w=
ith
the returned size:

We can have a DRM_NOVA_INFO ioctl, which takes a struct containing the info
identifier (e.g. DRM_NOVA_GPU_INFO), a size and a pointer to the actual inf=
o
structure.

	struct drm_nova_info {
		__u32 id;
		__u32 size;
		__u64 info;
	};

Userspace can call the DRM_NOVA_INFO with the identifier (e.g.
DRM_NOVA_GPU_INFO), size and info pointer set to zero, and the kernel fills=
 in
the size of the info struct (e.g. struct drm_nova_gpu_info).

Subsequently, userspace can allocate memory with the size reported by the k=
ernel
and call the same ioctl with the info pointer set to the allocated memory.

This way existing info structs remain extensible (as long as the layout isn=
't
changed of course) and new ones can be added at any time.
