Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493340;
	b=bu0/i+2vT+KP9/N7I+v0pHIQGwRI/OHSW1XXEWecyHC0qnqkRdugzDqQ2kPKv7F+hsUj
	 G3vPbGvhGUVfvppcPzVLND+bdAkS3NVevHRy0pLjKNRkADDygvyMA3yrL0Q4lIKiQoWYA
	 FQLFC9AyswEVOUnI9u+HRDwG74a+W7LSMecOh6YPRa0twhJu46YDbnFZUW3vzm86wRpIF
	 74LEV+JShV1ByYlfYoX0c0xPY7SSnvcWZb5WgaAznr45Yc5ThcUeufvg6ZXgODfVJncpF
	 2OgCgytRlGCBNvOh7/BsPsbSmAs89i8wFJEq1uvxiuhRE5cx4aMsNdsuO6q+DdMAZ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493340;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To;
	bh=6Uhgh5f0UkJqtxuPPZlStg6ICiuBZFc5JhOCR4BHkuY=;
	b=rwSnhW/Ord0vbaGFVtchk31NB64KZPINXQEX29RRBL1aSgaw6dHsKe+ziiKr/+Cqbo+H
	 Bv7YfSZ/QekklIjL8FiW77dh/r+2nYBXVWfEnCXxfSNWoA1o8wrSMGd+r1LFs898Kez8Q
	 cZZQvdzIXKTwibR63nXBWjFwfzyKvwG5jQBcyY6cWJc1LbbpT9lMT0PXgf+mRSOwh48si
	 mJH3N+lBQDwZHSt1k2Uve/ilUnBuag4nS3huZ0IjA+E4JzTTHjALh9BpjREj5yk/+Qise
	 6H3LGfai2jJ/aiWnadB/U4GRW1ipm/0Fs+0SepoSozst7/fDYRakjF9OcmeuieIgaSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VyxTUrUZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC65606A331
	for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VyxTUrUZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6011F00A07;
	Thu, 12 Nov 2026 14:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794493339;
	bh=6Uhgh5f0UkJqtxuPPZlStg6ICiuBZFc5JhOCR4BHkuY=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=VyxTUrUZDdCUiRmQh0hmFVPZb5oo70UmX5ge/ugQS1Wmuw2p4jZ1ccxp62yPSVCcZ
	 H6q5beXdT8gHM5iIbbufnC5qw3z4+ab+BrNLo+EUezuNQj77jcE37dhOrKuLMOfqGp
	 DK7SKgbxHyQzJYo8R9WD0PLEBdPVQdJ9rmO8J69eTIVa3v8B9/pLNByN2G4aChKYJC
	 u0oKlWJysrE8D0mLmk4QdKx8Dn/sw3xDZ59IAFr7204A3LpzdrFoyhrB1cPk7t/m1U
	 yJF9cZRY9zo5r7PsSTFKHVG8WAxd9386jLgPgXpABQC11tSiSvGbmZoqxnnlZuYq8B
	 Wmgqg5ezHwbjg==
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 15:22:15 +0100
Message-Id: <DMTASPUDKG3F.1H8JUZ5C0A2M3@kernel.org>
Cc: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Dave Airlie" <airlied@redhat.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 1/2] rust: time: expose as_nanos for clock sources.
References: <20261111-nova-timer-v7-1-3031c2476551@redhat.com>
 <179448764517.621816.16006004780926601543.b4-ty@b4>
 <DMT91N7BGPUU.17BEZWQDLH3CC@kernel.org>
 <87tslmupje.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87tslmupje.fsf@t14s.mail-host-address-is-not-set>

On Thu Nov 12, 2026 at 2:50 PM CET, Andreas Hindborg wrote:
> "Danilo Krummrich" <dakr@kernel.org> writes:
>
>> On Thu Nov 12, 2026 at 1:47 PM CET, Andreas Hindborg wrote:
>>>
>>> On Wed, 11 Nov 2026 15:23:24 +1000, Dave Airlie wrote:
>>>> The nouveau C driver does ktime_to_ns(ktime_get()) to program
>>>> the cpu ns into some hw/fw, so allow this method for rust drivers.
>>>>=20
>>>> This is needed for following nova patch.
>>>
>>> Applied, thanks!
>>
>> Do you mind if we take this through the DRM tree? Otherwise the subseque=
nt patch
>> in this series has to wait for a cycle.
>
> No it is fine, I can drop it from my tree. I asked on v6 what you
> wanted, either way is fine :)

Great, thanks!
