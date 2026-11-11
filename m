Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426508;
	b=Ep+I++FQ9oLpv9VuT6cNGhT8ptcxhVRsYQPVFXTQxcC3m3XXfh7RCe0PHRkiRUrCDe99
	 DBq0dWOPGs6M11azWUR240kA+EwAuczvzLpzlz6j0M3usd4NNk1p7OBeWh3fSyzOq+2gu
	 +uFzEYlRPOsFGpGCVLT0CuoXTiM6Y8uiQrgOp/RLMNN8uIcv3soeXMf8dn1il9p5eCp+y
	 Ov+cMDeHOLXihpW+rItniJNVC2ORiRfGpF3KpuZETt7v6GHp7hvUGlU2btj2KGxXzvyRY
	 XB0zk9zld/IpZZgZO0co273pSWveM9MBBFQDT0BTL31yPH24XgD5KcL83+ZZZIQoU2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426508;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=sreCxIXGIejtK05MJ82O28sfOgXln4JF8sALP5b78xE=;
	b=Sp5aRQY+KWMTAar7NgCl5f9vlVBMKIz4ioRGT/9OA0SjRjELr4x0+y0qQvKRRoabw3uY
	 FpMD1gPWZzdYOCXJ0B7qqT6sMjNkbJ1MCLcqDeJhycqYC9sOkH9f6US6F5Ii+pUKp4U48
	 xoCijN/ndVcT5kNv9xwuxh3yX75KZmnTeU8gqh20e+VMQxQPtm/HDoItOlQzZe7fakwOq
	 ZnsYMxNPqxLKL2lFYDQiqI/Kn1FUeRhOqiEooh5s1TRuXo12d08roCCd0nzgV1wHGji8D
	 HM51WEz6SVmebxDJ9trzHVkHX9It1nbV1vdd6gBI1W+p+pHuU0MsP+1EK2QaxG414GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsN3k6eM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAEC606A321
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 19:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsN3k6eM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7B31F00A05;
	Wed, 11 Nov 2026 19:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426508;
	bh=sreCxIXGIejtK05MJ82O28sfOgXln4JF8sALP5b78xE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gsN3k6eMqOCYeLtz+wraoZ5FHzTo8InlE/0idhUY6HPNbT4KDm0boRaK6Iyv8ObTc
	 TamNfRMfIhWeJYAKGo3nkV9SNfh8zEYNUNnq0ClJjKbA3HqPFENu1mYkpaYQYBw7aZ
	 VyN82hmfZJgsNzkpMkVxBCyifNVUsBbfEDcPvINmpcFUmo/naD4fAkELiynIbEVgtf
	 qFHLF4iCrXFtfnLWtUpo6f9K/9xTh21xx65ZCeZD1tJrR3Htu6TXLvPC+UeDUC7t/l
	 ChSYs+uJbzalY2k3bDGomejZ4h48rbBHg2yFJFZ0MkFxZHm8QAbGRfEOpvZL0xF4kP
	 BTbmmfnqUaCBw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie via B4 Relay
 <devnull+airlied.redhat.com@kernel.org>
Cc: airlied@redhat.com, FUJITA Tomonori <fujita.tomonori@gmail.com>, Gary
 Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 1/2] rust: time: expose as_nanos for clock sources.
In-Reply-To: <DMRKZL0RNSG4.3P7B0RM71I0CG@nvidia.com>
References: <20261109-nova-timer-v6-0-5544a3bd8b28@redhat.com>
 <20261109-nova-timer-v6-1-5544a3bd8b28@redhat.com>
 <HgxksqDneCpV2KCW_EeAGi_PEZ4HXYdwPqm0pHMkGPQlo0kktMkB-lNOjxQyUZtYhs1JzEFfjHyQAgDlVAqMMg==@protonmail.internalid>
 <DMRKZL0RNSG4.3P7B0RM71I0CG@nvidia.com>
Date: Wed, 11 Nov 2026 20:48:17 +0100
Message-ID: <87zevfup32.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Alexandre Courbot" <acourbot@nvidia.com> writes:

> On Mon Nov 9, 2026 at 10:55 AM JST, Dave Airlie via B4 Relay wrote:
>> From: Dave Airlie <airlied@redhat.com>
>>
>> The nouveau C driver does ktime_to_ns(ktime_get()) to program
>> the cpu ns into some hw/fw, so allow this method for rust drivers.
>>
>> This is needed for following nova patch.
>>
>> Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>
> This patch has also received a maintainer acked-by:
>
> https://lore.kernel.org/all/875wyoydqk.fsf@t14s.mail-host-address-is-not-set/

You guys want to take this through your tree? Otherwise I will apply it
to rust-timekeeping this week.

Best regards,
Andreas Hindborg


