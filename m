Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7853CFF4C;
	Wed,  7 Oct 2026 08:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362571; cv=none; b=oO3JhegXDwCVI4pe5BuL7mKbqOiBq+8+vZKkiBUFQXGFJ4CzWJHvXQbn5fcYyZQ4VW0oqwpiTh+lYEFF9jxDH+3NiEEuynGIiN6NgqHJNjmPK0AEoYZcXRolOgouCuqu5jRaX6YuFPAV+a2Hn/KorXKIONMTjsSvM/4BS819jCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362571; c=relaxed/simple;
	bh=SstKUUDbZi3A0ZijFnEazMuC3kjO4jhxCEUKCkY16sY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rSoPF0jB6gamSilIwtpsjK108lu8e41whDQ0IUYh36YSBsYsw4WATvUd1BwdQWX78mR5H8TVouz4aEo5uOpQ3FKLJYF5ezFMUNesCNQCuZ4YdeoottuZW9+FzHzSV2s9wAd7Ds4LPnoUifjtXTNqjAlqqIuXGJg2b/lr8LFx8Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLSIW7EJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLSIW7EJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9F81F0089B;
	Wed,  7 Oct 2026 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791362570;
	bh=H3xKoUM38vxt2oZPXRtHfs+TsIyNk5IpJbk3qE6lK9c=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=BLSIW7EJo21Bd/qqrMBFw78qz1ebjft1t8g6UEYJ8uiRIHYMueUHTUYgRKDh51s89
	 IDEHpUTvYQgN9LmL+svZ/mf/OVUTfih0YPLXP+zxwk4AYi/NI20Ubf+/2KmTvIEsCw
	 IJXg83ijKd+/zATxlWTaZx9A2+EYwZ5Eo8RoDEwAuALmCuIbDIJEnaH5NbfhRr970K
	 XP+7fDcZhMofDKm5u/DWpM8M7K+SMg+HivrJMnvKLjHrOVvO6mkHfeMg/0jOaCawpF
	 QjGMmZrXaAm5yzxT2a2E/m/1cquMIw/GCov0iuoYFgh5UflxzN7tmE1+LfhYLmWO8x
	 9b77J6u07IJ/g==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 10:42:45 +0200
Message-Id: <DLYH15Z18TCO.5CK2MNXMZUG2@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: firmware: fwsec: use zeroed() to
 zero-pad buffers
Cc: "Thorsten Blum" <blum@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Gary Guo" <gary@garyguo.net>, "Timur Tabi" <ttabi@nvidia.com>, "Robin
 Murphy" <robin.murphy@arm.com>, "Tim Kovalenko" <tim.kovalenko@proton.me>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261006100442.80432-3-blum@kernel.org>
 <DLY3SJLA1YG0.1YBCCD2CAH2IC@kernel.org>
 <DLY6MDDAUDFL.142WKY7PWTNDU@nvidia.com>
In-Reply-To: <DLY6MDDAUDFL.142WKY7PWTNDU@nvidia.com>

On Wed Oct 7, 2026 at 2:33 AM CEST, Alexandre Courbot wrote:
> On Wed Oct 7, 2026 at 7:20 AM JST, Danilo Krummrich wrote:
>> On Tue Oct 6, 2026 at 12:04 PM CEST, Thorsten Blum wrote:
>>> -            let mut ucode =3D KVec::with_capacity(aligned_code_size, G=
FP_KERNEL)?;
>>> -            ucode.extend_from_slice(code, GFP_KERNEL)?;
>>> -            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
>>> -
>>> +            let mut ucode =3D KVec::zeroed(aligned_code_size, GFP_KERN=
EL)?;
>>> +            ucode[..code.len()].copy_from_slice(code);
>>
>> I kinda dislike that this is now a potential panic, but it does better e=
xpress
>> the intent.
>
> IMHO the original code expresses the intent just as well, and avoids
> writing the area covered by `code` twice, on top of not introducing a
> potential panic site.

I'm referring to the fact that the original code expresses "I may allocate"
three times, while the intent is that the allocation is exactly
aligned_code_size.

This is much more clear with the new code, if we really want to avoid a
potential panic here, we could use get_mut(), but the ergonomics isn't grea=
t.

That said, I wouldn't mind adding something like Vec::extend_within_capacit=
y(),
which fails if there's not enough capacity.

Thanks,
Danilo
