Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794418251;
	b=3V4jQc8up9uelGPp1gWWuzd2ovA7JjX2w8YEoTitUidY2seIPFWZUEW/v4jH3dAKjGnV
	 lQqPfvSQI1wOqg4CI+j5ot/7HshAhA+arIOiRqYfF0HpRp3UH37dIHCKN6BviuOx4wngV
	 eQel0i4Uhrz1aIUObV0I8SclAK3qJcG5MdpzxdPERV/R0KxYmqmuKrnyRCI8L8jkasd9S
	 3sMJ67M7VvrBgxgMomsqMawPDgiCHoyBrl4kqKaaUBAEGNamXdrcNCe8+BJ7RpKAFkQU5
	 fVfOMkdgkI3ZvPwpD5CcjOpi50MoiAlaLWBAMmivn3fFhX87r4mJaRUoM0EOxnCXDaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418251;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Importance:User-Agent:X-Mailer;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=1k2NHm3wYDULZR/kuCR58w8mFKXB1IK4jqLtn92DBFvZ2mBKlCYkSfdWaIvLkQWIGwQF
	 2wppyJng8buS3gLxa6CjRuDzuFKJ5pJaNKcN6kBAhzAX4UQycwllciSf428p5YVxSJQ5E
	 S8zJyZw5X1IPXvA5LsIWEmQ96ATiUuuZ803TAjM88PNZN7flcqyRcgcVEeFFjpDivxvdT
	 sUV09apu8zKVRTxcp+7dDK40g7OScNeB11iv4+Anb9D/d/+uVe9FgAOURER4IYjwMA1xX
	 7PNnln9Tl1WIju2rxIhaeypHYtMmxdEk+oKEfmcaUm/xlZSYzsbUaj4h2E0i/VVQ7ZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=F0JXi3Jk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B795606A321
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 17:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B795606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=F0JXi3Jk
ARC-Seal: i=1; a=rsa-sha256; t=1794418230; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XQ+4kTy1Sbg+S2qNqks5/t4BdOZlkR2RGbfx3y/El1qrOUQAACXO4gR1elMHCCnS3PfaFn1wyBg9AJ526lxZxpkoyUzWj2PWQBkFIRJEQ+3Te0fLtNfLc0j1S0paBxNAF5Bww5IlcEcXP1LqCG+U279JEiZ1r5cSe6yFngmRcP8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794418230; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=DgKZQP5SIj85Z+b2Ao90Am8f3aCxiUdNAXLepTZn80nMH5elWAeJdpif3MJw/baWpFno75pkfxoJ+tVXfnemyJqpoy80pA7jGfxN3bUTRsNE0gpmHbhFrU+Cn/paHcjy84knPtCp+Ag8JgVyBJgrCgKUfM+NgsWIiZeF/KWjBLQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=F0JXi3Jk1+ckm+EuI/KcTpwx6KLcN8S2S6w05QcozMJ25TNkCNkLdBa8MvUdDiTbqO54Qc9Pxdxo/BkRd9NrBN2MZ2/YT/opWYXHRUTqFeB167MonfJNVH4nFVdRnAbmLKIuqKIWQtpn0z29rV7B/CY1Op1bhd8FU5YgkfLMg6M=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1794418227715371.06425639823635; Wed, 11 Nov 2026 09:30:27 -0800 (PST)
Date: Wed, 11 Nov 2026 14:30:27 -0300
From: Daniel Almeida <daniel.almeida@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "aliceryhl" <aliceryhl@google.com>, "acourbot" <acourbot@nvidia.com>,
	"ojeda" <ojeda@kernel.org>, "boqun" <boqun@kernel.org>,
	"gary" <gary@garyguo.net>, "bjorn3_gh" <bjorn3_gh@protonmail.com>,
	"lossin" <lossin@kernel.org>, "a.hindborg" <a.hindborg@kernel.org>,
	"tmgross" <tmgross@umich.edu>, "tamird" <tamird@kernel.org>,
	"work" <work@onurozkan.dev>, "brauner" <brauner@kernel.org>,
	"lyude" <lyude@redhat.com>, "j" <j@jananu.net>,
	"alvin.sun" <alvin.sun@linux.dev>,
	"deborah.brouwer" <deborah.brouwer@collabora.com>,
	"laura.nao" <laura.nao@collabora.com>,
	"beata.michalska" <beata.michalska@arm.com>,
	"nova-gpu" <nova-gpu@lists.linux.dev>,
	"dri-devel" <dri-devel@lists.freedesktop.org>,
	"rust-for-linux" <rust-for-linux@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <1a1cba939ec.316e688b263885.5117314523612320809@collabora.com>
In-Reply-To: <20261107021427.2105374-8-dakr@kernel.org>
References: <20261107021427.2105374-1-dakr@kernel.org> <20261107021427.2105374-8-dakr@kernel.org>
Subject: Re: [PATCH v2 7/7] rust: drm: make Driver::File
 lifetime-parameterized
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

