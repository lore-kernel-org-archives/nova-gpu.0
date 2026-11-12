Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491458;
	b=NFXBr+mQ15RW6rzKtJlhwf7uOS9rackBchXejcEv4o2irRApa/DH/ryQanmWe5QP9XbM
	 ak9ujNYXY/HrWa8ZPGDrDx3zLOgaKuIXpPLkB8tmrerZLdAZ7YBrYljTKtbkqd7iBtGfx
	 P/nwCQ5Ak49Y6dA3HFrqQ61kRCpYtO1hLi/1J5UgmAyYJBAkt77ETrLwt/mgwQ8gkT4Rf
	 rF4CG89CDdJDZhnXBjwCJTB4GEWWoVG8I3vTiNN7sD0qJZVSsSyVr0xkABe4O+YKB3ZJ7
	 gmw70F1DB9u9ObtAPjv+L+/+BswP/F4pVCy00/NfASt9nTRMbEin/VqqYPWV/lHVGag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491458;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=b2rTD3RNw/wmfQmagbMmHdQ+mRLznGGUNUzFgFRsNVM=;
	b=H7pBJiQuPmnYRsnMGx/WBOzLo9c7sMLO7G4uwhafW8sebjCie92goByeaMkBkn6LzasU
	 S9L5LL4WRy8yTohDtxdk2vI3rIoA7cPm6X50SJr2AfkWhJX7BwVezqpcVBYB32XvnENL0
	 szkH96AtMW9eE+ppFNTv2AJVQa7ooiQ4F4CW5f8WVFC+fQwlgddDlBiXHATrxa7aqMGr3
	 EazTNlkoptsMi1IjiOoCiwfJLFWxLh4t+r83bm564RZooKXxYy0fdeI1l4TmcG+AHISsq
	 JP416Nu+iHhCMm+ApTSBicDJdjQ5scj6+8tLXfgOPv5CSWYqIoq4K4RTHi2BciMX1dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ou8Ls/u0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CCD606A31C
	for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ou8Ls/u0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EFF1F00A05;
	Thu, 12 Nov 2026 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794491458;
	bh=b2rTD3RNw/wmfQmagbMmHdQ+mRLznGGUNUzFgFRsNVM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ou8Ls/u0SV/9IsDV8EHksS4J/VjPYYOXNnydIW3tI8ilMfGYgY6oNJjiRD1fcQJkA
	 vbV+gRMyBwaXmf8CJaP2VQRcQ6RDmfabBNpgNUE2a5/62VWrsU9XDpkNiY3umiZ+sz
	 /RaUGoWF20VS85myoaH3EPKZ/meNWorZOhGxD9v3Y9hSKGRc1ZQTW1WREFyzRPAB/h
	 YTX18PMsE4XOdPHcNbO7Tx1+SlayX0YrFrOtpeMoap1Uzbx0VuEgzhCn9siS6U7kPb
	 ELGePdQsPxrVkCPUIwoeCTAxrAy9N2um/VbEd3zienj3lyof4ig1wlXUC9JYMJDnDF
	 MgJoNZADZfY8Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, Gary Guo
 <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/2] rust: time: expose as_nanos for clock sources.
In-Reply-To: <DMT91N7BGPUU.17BEZWQDLH3CC@kernel.org>
References: <20261111-nova-timer-v7-1-3031c2476551@redhat.com>
 <179448764517.621816.16006004780926601543.b4-ty@b4>
 <DMT91N7BGPUU.17BEZWQDLH3CC@kernel.org>
Date: Thu, 12 Nov 2026 14:50:45 +0100
Message-ID: <87tslmupje.fsf@t14s.mail-host-address-is-not-set>
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

"Danilo Krummrich" <dakr@kernel.org> writes:

> On Thu Nov 12, 2026 at 1:47 PM CET, Andreas Hindborg wrote:
>>
>> On Wed, 11 Nov 2026 15:23:24 +1000, Dave Airlie wrote:
>>> The nouveau C driver does ktime_to_ns(ktime_get()) to program
>>> the cpu ns into some hw/fw, so allow this method for rust drivers.
>>> 
>>> This is needed for following nova patch.
>>
>> Applied, thanks!
>
> Do you mind if we take this through the DRM tree? Otherwise the subsequent patch
> in this series has to wait for a cycle.

No it is fine, I can drop it from my tree. I asked on v6 what you
wanted, either way is fine :)


Best regards,
Andreas Hindborg


