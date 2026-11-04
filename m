Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751060;
	b=qL39ePVdGd2rEpZSS8u57NaBd+Ow4KRthmx7Kae91eUJLWuYi2zHGtoVyB8qVjccui4z
	 a3kYAjp2gPS4a80oieYcaN+NaGbxYJ+5FBen5/jb4OJpv1UIFwCarV5zxWpl/7xLS7Z5J
	 Adj+Y2Us6LuECXYInnRc7QmEHzl7jsD/a+fFzZhp2uLiXuPvBkJYw19HFvTwo/50MSKF0
	 SFL68LYmLO5GFPpuxB1pIlE6n3nzmfRYJ3Dur18agjkeyGArcflEeT39KyQaF/woCc6Ev
	 gnSuM3NwDF3NYS9kCMSW0nE5BQg3eDAAEHsTeOzQXWh515gnj+wnBRKJoGFBUPug5xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751060;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=P9/LZSiwpBYvR6RLRsenOxNVNg807obrF4OFAmJWO+E=;
	b=KiQWaMHbzr7okBIAkQb4V2SpPj4kQRJ/obj00BowbExi2KiZRexP/I/n+6t9lW0vK3Bh
	 Zcx6ljdKR9/OCUrmy99CZ17FE08IDjsXQrMsyxyHWFulu9jjuQ954sndKI9Srn6tGUyyd
	 kN/hz1VzAWG+k8QnQ2q7PBf97gQ/fmOWlGtrkQTb8469+K1OurP3ZSwRQ2YUE58b2MHyP
	 W0q+TRmFzr9RA1iDUHMjYWnEWOwFqI5SeEMisqe0Aj72xvMkLdIjkqXNElo/kYup3TRsz
	 5/wx5e7o14/hmDD6E8NCkqzEusPQjuPQ6usGCHBpuZkaKHNE15I5D2IZ6SwvO0g5mwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQuOKG6C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6D1606A31B;
	Wed,  4 Nov 2026 00:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQuOKG6C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182AF1F00919;
	Wed,  4 Nov 2026 00:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793751059;
	bh=P9/LZSiwpBYvR6RLRsenOxNVNg807obrF4OFAmJWO+E=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=gQuOKG6ChTvEtABskliEEOfG1GiX9pCbvAnpuEAiYRE8SCafBNn7yDJZhn0KqmdQR
	 CyFXNEnBWlV3FP7lLhQpVTR/ntPrcnjqyEdeTcEcFgUzw4PTxKBqwrzneivgJFD5VN
	 dISTNyMcPyYlWYhUDP5N6Gd6LJZ4XctcMe07fjKzUbkDALhy8Pi9SJRB/BLo3vlp15
	 VYnKBIQePf/7++su2FpXA2Gx4q2ycAuXPUKdhIpWc6Jvh4xt71Ikz2HUc9yUdJWRKc
	 sq1yJo1PgzVWlS7ClPFg99zkKr5RIUFNDizphhsLHWzRTRXUY+i1QJbDAWiCGKWkbc
	 XT87kjTMQOIaw==
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
Date: Wed, 04 Nov 2026 01:10:57 +0100
Message-Id: <DMLZOJTIQ2N6.1WNIKHGVV3U7T@kernel.org>
Subject: Re: drm-rust-next needs a commit from rust-fixes
Cc: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <211cc191-828d-4494-92c4-168906a0ede7@nvidia.com>
In-Reply-To: <211cc191-828d-4494-92c4-168906a0ede7@nvidia.com>

On Wed Nov 4, 2026 at 12:25 AM CET, John Hubbard wrote:
> We still need the fix [1] for this problem applied to drm-rust-next,
> as of today's (Nov 3, 2026) branch, anyway:

We can't apply a duplicate of that commit to drm-rust-next, but I will back=
merge
-rc2 (which should contain the fix) once it is tagged.

In the meantime, I suggest using bindgen 0.72.1. If you don't want to chang=
e
your installed version, you can install it separately:

	cargo install bindgen-cli --version 0.72.1 --locked --root /tmp/bindgen-0.=
72.1

Then pass BINDGEN=3D/tmp/bindgen-0.72.1/bin/bindgen to your make command.
