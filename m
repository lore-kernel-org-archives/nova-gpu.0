Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009411;
	b=x7U5xA9eVrtEM0CkQFb06j2d94CUEGh3/cHxn/Hju5ZU2CqwwU7h1ZsmYubBURJemYs7
	 7mdcLpiIx63VbxCtt1xHkEWctBp9UcbCPP8NS6YDl3aUw0wXgmOS66VbhTxu6ZJ/McE/r
	 uHQy1bzRLQu9FMZlq82rn6LihKT/ujXv4TgTmW7INqg3pzchL3doZNzlSbspdJVIRgYGY
	 CaaoytRsZrDKmmTlsN9PmhEtEk9FgAn8tMfSo7WY9A7C+XfvsZ8D0+/rOVythafp3Va0D
	 5FhUPjKBd8pZRS2hmi6mFCda6XRLymoAJ1baAQP43wIKXq1idYy+PUqpS6h9qFoeP2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009411;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=SZhbjTCvyeYeAiHPVLmXnHx0Lv7P99e1Ujxn6I4op6c=;
	b=BRYgoieCrjWLs7Zs1E79KJaGA7SfmPxLyMnkEMCpDDDz5RrJ0BrTO+mh263xdwtnk4P9
	 kcQTjrrmh64oT2F2c4j75E1lHMKT3CZDRdBvUx+Ueima/txZ8/DEewc1MdB3xJM6ndps+
	 dYdsq6JnyMx+dNzwdpbmCVfdYIpqy12Ub4J3nBEYoAqAtopjhj5nQNphQT552dPttzm/P
	 W80cguDIcteqqoj/qb5KjOZOIffuCHK7MuMbDma15ugdWHBExlw7sk1GuzLCbgDdiQUet
	 FHFaIEtMiSwGrD4Wswu0wrX4+xFhArDUpFzxf1sYmEwGZGIgmWs8l2dnTqgd5MuWEvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ETob+shf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D974606A339;
	Mon, 26 Oct 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ETob+shf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790B31F01287;
	Mon, 26 Oct 2026 10:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793009410;
	bh=SZhbjTCvyeYeAiHPVLmXnHx0Lv7P99e1Ujxn6I4op6c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ETob+shfraPTp7w9jjosEYhtPjKSrdNwYB9bugouHixE/9NDiegpCtRNkOZcXVX1c
	 qm8odjqciM+kZczVKHj+Zxp2ePkZheSRKPDOJkEhBNwV03Xyyq39dQG8YLQIG9EQ3O
	 eafpRZS0eyrrsMlCZWDMaz3VMXQ+v7hemHPV69DfsF7CW6s83AfolH07qr/fWR8VAb
	 Cq+nD7OLBD+PmXird+tBznGZ5VcBvCDMQ/DvXgOiKHtBtkOMvu/ax+3/Bd17xcJoic
	 9VUMqcTo887YBRSblVjfeZU5AWiecQjjP1iZ4GYfEfcPlBNqmNByASMaPmHaRkKxsl
	 P16/O+MIzEA7g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>, Boqun
 Feng <boqun@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lyude
 Paul <lyude@redhat.com>, Gary Guo <gary@garyguo.net>, Danilo Krummrich
 <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, Dave
 Airlie <airlied@redhat.com>
Subject: Re: [PATCH 1/2] rust/timer: expose as_nanos for clock sources.
In-Reply-To: <20261026-drm-rust-next-v1-1-14a4ae469175@redhat.com>
References: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
 <jslVeILJWygrZ4H5yD2MJB2B7xCBAh27ivODK2GQfYCMxV4HJKhgrplTy56c6l-eYnIda-AGQW1y3Vqb4dP7ew==@protonmail.internalid>
 <20261026-drm-rust-next-v1-1-14a4ae469175@redhat.com>
Date: Mon, 26 Oct 2026 11:09:55 +0100
Message-ID: <875wyoydqk.fsf@t14s.mail-host-address-is-not-set>
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

"Dave Airlie via B4 Relay" <devnull+airlied.redhat.com@kernel.org>
writes:

> From: Dave Airlie <airlied@redhat.com>
>
> The nouveau C driver does ktime_to_ns(ktime_get()) to program
> the cpu ns into some hw/fw, so allow this method for rust drivers.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg



