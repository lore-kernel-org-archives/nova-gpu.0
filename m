Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793534510;
	b=hhCMZq4mO9akeD8yZIkeYa2KJ/orSCOWDYePSPWIubFOusHK3UNW20Vwz1zV+j8S0nbJ
	 ZaXq/b1jhrTiXJ4LX6Iq7Kr+DpaYdx7LCccwcC+gwyARsCmqo/EnCfPBS0R7Z7n/SehlE
	 2cBsgP4UQ3cxkKqlXbN2zoTK1QTpuQiWdN48CRN24yB2WX/gXf6itH4hWK0f/eRiKD5Cw
	 eYjEeT8QXOTPZJC1ydlcY1A7v2WNvWxPn7ELwf2pn0gB+ilHT92ePEebA8aclOfZSjab+
	 xuuRtT12cAi31DXdRtIvAsIm/Y92QMal8VP2ZymrRbg1bNw0U+n0xR8N9jSq2AKBOew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793534510;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wS9o+NwMaRYVgY9LbC6icY5Ab6GErT53mpUdVJfCXH8=;
	b=DXSVKABYcm/MTYcJwfstzE7syz3/TbTd9l0NT+G51jTdBoBAjwnG8UwFMFqpTqDujsnK
	 GJe1IsyxyLW43qilf70t0+Zvw4xcLIpMWGw6nAgtTFPC9lqM6XGrEAeVSigYtM7P41Uyv
	 iW3CvJqd+GOpaBhJYVTSNg1R5swlMn6vDroyGjzTcNVJx/7Xe+j+V3RWas8/Nj1U8Lfgb
	 VOYrIvHPp43q21P/VJw8l9Q1AhTyzlPS4G3fL68fap15Oaa09vEwmS9GOtWEZVD2z0zi3
	 L+eHVJz7ygFIp5/4idr9YvEU0+CkQXp7ZKHgQcFgawFiRGCuxT6y+K4e6dZuivAwf2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cA1+ABKb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB919606A325;
	Sun,  1 Nov 2026 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cA1+ABKb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDDD1F000C1;
	Sun,  1 Nov 2026 12:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793534509;
	bh=wS9o+NwMaRYVgY9LbC6icY5Ab6GErT53mpUdVJfCXH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cA1+ABKbo731ffm836OwKT/1bK9PZFnZehcIBETxJtBu/2KsRnSrGqz9MOTazR2p+
	 M9FvCeSZJJRqdWPGRYVXvcCu+pMiThTWeYxaAUXJ8xfOnTTMQMKSDau5Xl2gf8j84W
	 /MzO9MUGztPe1KmjIcoRCgBwmTP6ZiZlP6jZcuiyPS8YhaEy6OCmt95RYW+oKdYtt0
	 Sb4peCb0ovcIxeQcMSSye1wiMeeMrPLKWaJNrs0vduNM3lrXZXSzVu9pxDPLdLEMZy
	 B573cZVc+FO3CBdRZUNvxIy1AmO76Ddu6C2NSz09Ps/VIoSk9bbEE4QvNsRx76Z4DG
	 Pnc0oMnosSL9Q==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	jhubbard@nvidia.com,
	apopple@nvidia.com,
	ecourtney@nvidia.com,
	lyude@redhat.com,
	kherbst@redhat.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] drm/nova: make unstable uAPI use explicit
Date: Sun,  1 Nov 2026 13:01:37 +0100
Message-ID: <20261101120137.6074-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019212535.88390-1-dakr@kernel.org>
References: <20261019212535.88390-1-dakr@kernel.org>
X-Patch-Reply: applied
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 19 Oct 2026 23:24:44 +0200, Danilo Krummrich wrote:
> [PATCH 0/3] drm/nova: make unstable uAPI use explicit

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/3] drm/nova: mark the uAPI header as unstable
      commit: 4e85d5f62ec4

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
