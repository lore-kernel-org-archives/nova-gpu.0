Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874537207D;
	Wed, 12 Aug 2026 15:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550087; cv=none; b=BM/emdfUwGe616YEl9D7tYtNda4S62weFUNKVBXRPVv+AR2+bnlTRLu9i/i71l8RklWotZ55O2A70ko2OFzkDeeEq+D6/Mok1ZPW3imeueYgSVnQvGdDQTq/4aJoyJnHHz45DaGV6IO6DnuQCfrDq06GxyBcmk0HWW9PJrcSZtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550087; c=relaxed/simple;
	bh=JkcD/2eDWSdNSRbxebDp220oH8c6M5J5gDR4uLmishM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EIQMmnJi2CafzMtrN4a7HgUyghLd9Dr5b4PqSIzmnxuBvGvxjeHHUTlPNuUHtkYEUNQgu7QkF4y1auVNMG3KFXpJppJIzhxUNQ/xfGH6BG5ZdNIUv2t/zg90rvNwfL0u6n+X+PtIQJ8Xp6Xk3EfSDyrs5aO0OXCuoqbW36EUF3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTFnkSxm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTFnkSxm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0551F000E9;
	Wed, 12 Aug 2026 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550086;
	bh=JkcD/2eDWSdNSRbxebDp220oH8c6M5J5gDR4uLmishM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=PTFnkSxmWwllmBacdl70CAzZk1gpzfU3spfkZ4u7biNEvDINyDn386cxTKs6Tixqh
	 6ubD+0E4e1SNMJR86MY6yP+w6Fvc/ZSkGFhcAt6URB2BwcSrbpl+wB4urscD5iDfos
	 S4wRhCHCKd7vmcnG11zuB2u+evcibjXcceEQKY2cMTkMtXcI8GGf9CZ+aiY7UmA7Rg
	 kgHfw9BuWbwTMqcIobFFsrFjR+bAasxyc22KM5Kas5Uz2QhWFrYYSNd2/j5CU/hdkY
	 FoZD9hm7/EMbJ14silyjkZ5fKDwROsTWvgwc2CfvVfMbGD1wQWf1lSQDgH9jJ25HeQ
	 bljntta1YOCXg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Aug 2026 17:54:43 +0200
Message-Id: <DKN35E0L9X9L.RSVUGPFWRV69@kernel.org>
Subject: Re: [PATCH 0/2] gpu: nova-core: retain the GSP-RM log buffers
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>, <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Vladislav Zaharov" <vladazaharova2018@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260812113752.532537-1-vladazaharova2018@gmail.com>
In-Reply-To: <20260812113752.532537-1-vladazaharova2018@gmail.com>

On Wed Aug 12, 2026 at 1:37 PM CEST, Vladislav Zaharov wrote:
> The testing was done on top of e6c2c6265521 ("rust: firmware: add
> request_into_buf()"), that is, before the TLV firmware series, because
> the nvidia/*/gsp/*.tlv images are not in linux-firmware yet and the
> driver therefore cannot load firmware at the current tip. The series
> applies and builds unchanged on top of drm-rust-next.

Unless you already know and decided against it, a firmware archive containi=
ng
the compatible firmware for the current tip can be found in [1].

[1] https://github.com/ttabi/linux-firmware-nova
