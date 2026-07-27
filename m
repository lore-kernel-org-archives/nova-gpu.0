Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D31328B4B
	for <nova-gpu@lists.linux.dev>; Mon, 27 Jul 2026 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164851; cv=none; b=ahDgpsDiNgKwJSYu4GMC+rGQtHdwa/AW2tnaFQIMKO2NX5IsUoLfGP315w63qlyeHGWYWT+stdklZTWubJbG5zzGXpXHjiqPCDSesiU+vmM9JY8L2rWnS26l2i4BF7XRuIBKNuTqVcq+3NVo2UVhXBq4B91ZGHyHRREGI4mCtKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164851; c=relaxed/simple;
	bh=qMDLaeuxdamqLKE1K8+ySJXHw803Ca4O2g3gl1+Jc0M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QG6XX2kf7/t9GqnkLq9VBXFCqyMkJyOQCW2Zwa8aj87jN+UQXw4gCQHKLww5rH2ElO2Vk0GwAXM53Gi6y8Cb43iVkUfvj6ISxuc4bscdAuRgPqdakkvR8ze2+Bw210S48mUDro6KTToanjgtBb87j5EhdREROU6CNtjRi8pDm8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com; spf=pass smtp.mailfrom=nanonej.com; dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b=RiOmNjGG; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nanonej.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b="RiOmNjGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nanonej.com;
	s=protonmail2; t=1785164844; x=1785424044;
	bh=xkuxvFccmFVRVInzuu2EHAa2xXh1BYNKHx93LHBfZrY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RiOmNjGG51L1C0DmB5UBZBOuHYkfR4GzjmV9pFPVgVXAbAX2fom56/P+iM4NDNp2Q
	 6eum65Gp8iTRw7wU7tL83FmV3Lfev/cSfkBMU3MZfm7Rk1d9BvJmAmuJ8G+Vo6dSOQ
	 F0mN+qZLBkCINPe3gCbbM9kJdvYRpijgysOZoqL2Lyap7sVFpaHIyhmAecSt+jMblC
	 RwN1Vx5padPSEzTr37it1OiT8CEUPEPY2eHrEW6iNDX2ugUifH5paIxBUDnuJBM0AC
	 Jd9ORCnt5C6b8l1MCP7wSNMBxZ7FsMcXUuywqN22j9pyCxCyj9W5Mz1nTcPwDNLnDD
	 NfeYVKL3qhOJg==
Date: Mon, 27 Jul 2026 15:07:20 +0000
To: Alexandre Courbot <acourbot@nvidia.com>
From: Nanonej Dev <dev@nanonej.com>
Cc: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, daniel.almeida@collabora.com
Subject: Re: [PATCH 1/3] gpu: nova-core: Add function to query WPR2 range
Message-ID: <IljsM9ZnqA5Z6gdvmYSbSJAjRNiW5wACb-IG-yIvmYV0JUFWFzWeK5vV1jv_gPjEqtHqeg7JES3GwsNhnLv87mzf7N98YKqUmPbcIjz2gZY=@nanonej.com>
In-Reply-To: <DK7OOBTQZKDQ.QOMIKY35YTVP@nvidia.com>
References: <20260721-nova-core-regs-split-v1-0-384fa2a42244@nanonej.com> <20260721-nova-core-regs-split-v1-1-384fa2a42244@nanonej.com> <DK7OOBTQZKDQ.QOMIKY35YTVP@nvidia.com>
Feedback-ID: 32181229:user:proton
X-Pm-Message-ID: 7ba01f28ddd1c1f530d2a1a010c348a8909060f8
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------37fd3545826f383248dcc478093c8c09fb6b1d7be79bac7e88bb897bce576508"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------37fd3545826f383248dcc478093c8c09fb6b1d7be79bac7e88bb897bce576508
Content-Type: multipart/mixed;boundary=---------------------612aad6bea675f4cfa53d1c6e7628293

-----------------------612aad6bea675f4cfa53d1c6e7628293
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

> To preserve the current semantics, let's read WPR_ADDR_HI first, check
> `is_wpr2_set` (and early-return `None` if not set), and then read
> `WPR_ADDR_LO` to build the range.

Ok, I'm udpating the function flow then.

> > +        // Check that the WPR2 region does not already exist -
> > +        // if it does, we cannot run FWSEC-FRTS until the GPU is rese=
t.
> =


> This comment is reformatted for now good reason iiuc.

My 80 columns OCD probably triggered, sorry for that, reverting this chang=
e.
-----------------------612aad6bea675f4cfa53d1c6e7628293--

--------37fd3545826f383248dcc478093c8c09fb6b1d7be79bac7e88bb897bce576508
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmpndA8JEFKmzSsu6sDwRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdvFx2z7wqc+SThorTb21CD3mEN3epB6SM0POI+
xH7NgxYhBI+99gDJjAW7MoHJ0VKmzSsu6sDwAAAijAEAnBty0jtnXMHXRu6A
1TsIGaztACF1FEup8otcJBQ27Z0A/2dlYwMaNKZOCPQSs0pYS8HXAkTCvwiw
Vw7H9+CV+CUJ
=vb76
-----END PGP SIGNATURE-----


--------37fd3545826f383248dcc478093c8c09fb6b1d7be79bac7e88bb897bce576508--

