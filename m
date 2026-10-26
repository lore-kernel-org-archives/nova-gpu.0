Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040655;
	b=KV7L9msS8cUfbWBysxLu17NgumRQEFeEOsLzjDc+M2B9l0Zf6Xdj6oeqWnVrinHOfh2A
	 0pXPF41uU4iOb9r/82QU3mE+qbF9ICk9yQDFXTzM9ezuYddsqkcIdvOiVlVk6lRWuLxFk
	 ufT6eisPV0ZVUf+6x34zleSvVGetHtB3LJi4mo/hQ1CU1rGPNOS/jbcw0Ar0N3acC8llZ
	 WLiIpLYiZXovIwEYDYSCSsmoETSkFZ/5UdQhDwoCjPGn7h/SolZnjop5MBTfNkVIjoL0K
	 K+MpZJ2JxAE/MlhPqWEo19FilKFh1HIbo+BP9PXhvxPrbl8S1lj0TCidpbkRr24aSiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040655;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To;
	bh=ygtj/oT70XXAeLhMLm75r98qmCglsSTArDphuGHAX/I=;
	b=qvNytO4+TAz48TwUZNLZjKnuUz/MoqptVNdiGNRgkfVI9ZcS+7BHGUPte1ERKr+QPp3z
	 8j/H17H/8HmEUFZTUDuFTkbOQqZtQuONe7NpTQXebbi0P3nuVk172BE7oQr01QxXI+RRQ
	 GfAlyi2StdODe/++1fFGsIyLMPzmUt22b6Y6/qW1L/453ZgiMc16ANoO9JK4P6uG5FYyt
	 O/aiDAAwVBFqn1ONZyjfO5UeNQP9F38P9qc9API+CWLudL6tYG2e6uLlKFFq3qDbdSpwz
	 JbwqZInwimxZ8cFDCQXh34Q7uqoZCyaJecmhvx17S1b2RayWkCeTk0K9jNzrG2qgxlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g5VyKavj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD228606A31A
	for <nova-gpu@lists.linux.dev>; Mon, 26 Oct 2026 18:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g5VyKavj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7EB1F01825;
	Mon, 26 Oct 2026 18:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793040654;
	bh=ygtj/oT70XXAeLhMLm75r98qmCglsSTArDphuGHAX/I=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=g5VyKavjI10gkagJODkyzZ7acpHi96JPWtvrrCEIoOf0j/94q39dTOYjBSaHIaufR
	 rZOMz6RtCkeqybXa3CMUVkqN3djCcvHEymeOW7bjNITIx1Fg2DVjrqw811jKVwfadx
	 ynpgABm9tMWmbpwf+6oBxiTTUlT1ChbL9FUwu09PPJZwxTikhlv4/zR8Yww+oWsI7W
	 oWgDlAoTK6218Gjx6L1pfOQhAuG7NxLKm+fsnNwr4RYVe3EV+iQUVAgfdix8HJrIVY
	 Ht1qd96zVATIbed5OAlKR60dvkYMSqhB5O6CKuMMZPm/uKm+i8RBT99cOE+vWoeLBb
	 wx/M0pZ4JsNVQ==
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
Date: Mon, 26 Oct 2026 19:50:51 +0100
Message-Id: <DMEZV3WOR5TI.GMTG5OXI3WNJ@kernel.org>
Cc: <airlied@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Dave Airlie via B4 Relay" <devnull+airlied.redhat.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: make pramin/buddy optional
References: <20261026-nova-pramin-option-v1-1-d073b3f047fc@redhat.com>
In-Reply-To: <20261026-nova-pramin-option-v1-1-d073b3f047fc@redhat.com>

On Mon Oct 26, 2026 at 5:24 AM CET, Dave Airlie via B4 Relay wrote:
> These aren't used on systems with no framebuffer memory.

Looks good, but I think it would be nice to have some more context in the c=
ommit
message.

Thanks,
Danilo
