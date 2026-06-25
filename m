Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2061A3382F9
	for <nova-gpu@lists.linux.dev>; Thu, 25 Jun 2026 21:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782423502; cv=none; b=CaiGj4NO5FjBD3OynhHsCeR6/4oB+UmzefYiJnutSdawhMLCqfH/pAb7ykeKCm1Bah9P7pQwpE2+oiJBZNMF/Ri5tI3FDazBQtV3/HocjbBTg3ADpD2ZRAV4KerhGBjUKRinK3qyAW43ZAXhN5pP+JRwStJzvAo+CwXF5jmTnyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782423502; c=relaxed/simple;
	bh=PQcX6Uv/dH97W7ij5LT6LvrgrCGKDXJ0aE2uWqv2s34=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=SbOYLZzW5qifM4eOGHarmD7bDueqZ7peNLwZopNDapIYNk7HEneW7ikolVm9KTfj+Rt1KCzEmyNUGiDERSeDv7GFSOA7Y01MVD4XngOJE1SvBiQBfpwx16SgynF1I3u0OfKkE6uIaGWWRAUQTLxZiYsaVN+AUrXxmfaO0FCIPzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nF4zWIOz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nF4zWIOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AC81F000E9;
	Thu, 25 Jun 2026 21:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782423500;
	bh=PQcX6Uv/dH97W7ij5LT6LvrgrCGKDXJ0aE2uWqv2s34=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=nF4zWIOzesPxsOAIEfecPfbFiXcfj4ZK7OVTC6kBYOGtAjY5YpPRp1W+8Sjn1Z8Fo
	 ZH1s2ZiNAQdkOW1vky/g5ZOvXBJazIe0q0vhaYwtEwqkAiDVDX79gnMlPli2VNwNiz
	 ftXqqyNQ/WHO2BgGHxcOYGTUGhtMumeLwIP4MsCu75/oKfDG/oC2rLL4OcjelI/kA6
	 UJ/IOAEz8YJgoWsTPpHFbfBdWaAApGf9gEQcLN9v84eGlIRuuAjXwwrnHsO+EM2iLB
	 cEC1BiPt3pi517v/KeosvdaUbUqUDhryjInVZ41gxtX1frFMLCHh6OBNaKRo3Ks3W1
	 +s/H2V1qsn6qQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 23:38:17 +0200
Message-Id: <DJIGEANGKENH.3L3T55PFRGY3Q@kernel.org>
Cc: <acourbot@nvida.com>, <nova-gpu@lists.linux.dev>,
 <aliceryhl@google.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ojeda@kernel.org>,
 <rust-for-linux@vgdm.kernel.org>, =?utf-8?q?Nicol=C3=A1s_Antinori?=
 <nico.antinori.7@gmail.com>
To: "Pedro Yudi Honda" <niyudi.honda@usp.br>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/7] drm/nova: replace `transmute` with `zerocopy`
References: <20260625190553.7245-1-niyudi.honda@usp.br>
In-Reply-To: <20260625190553.7245-1-niyudi.honda@usp.br>

(Cc: Nicol=C3=A1s)

On Thu Jun 25, 2026 at 9:05 PM CEST, Pedro Yudi Honda wrote:
> This series follows the introduction of `zerocopy` to rust-next and
> replaces `transmute` traits with `zerocopy` traits. These changes are
> mechanical and don't alter functionality.

Thanks for your contribution!

Please note that this patch series does not apply to the development tree o=
f the
Nova driver; patches for the Nova driver must be based on the drm-rust tree=
 [1].
Please see this related explanation [2].

Also note that there's already a submission implementing a subset of this
series. Nicol=C3=A1s mentioned to resend once the backmerge of Linus's tree=
 into
drm-rust-next has happened, please align with Nicol=C3=A1s and base your ch=
anges on
top of his changes.

Thanks,
Danilo

[1] https://gitlab.freedesktop.org/drm/rust/kernel/-/tree/drm-rust-next
[2] https://lore.kernel.org/nova-gpu/DJFVRMR67B0W.2AJBHU1PWDPFT@kernel.org/
[3] https://lore.kernel.org/nova-gpu/20260621143647.264770-1-nico.antinori.=
7@gmail.com/
