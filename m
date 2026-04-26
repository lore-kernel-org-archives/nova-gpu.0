Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDCE2FBE1F;
	Sun, 26 Apr 2026 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777239187; cv=none; b=GPO7znMvjZSGa6SFLMnRkm2mjoPQwucW2zJwhm2b6F68pDiSSRijn+CEtoLupRTTKnISuBXMaTMKT61bujmVbDiEJMngxWTwG2/8bjaElKqnZHPvpNlMgwtw4CksIXQBXsCbBGC/dbypmqNxF0xGr0WPqMYJRHsLeIC+o1HD/+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777239187; c=relaxed/simple;
	bh=hhIRGFDgMyHb8qHPStrp0zkhGvc8+JYpfKJhJoTAMGg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From; b=KdJYY0EzvAWcdM+SKzpWBzzKVGv4IBkbeI3jNLEotGqq7YQ1Wj+78IESaYO1Wwi+HRmoxhwpE95uxexb6bYpS4pKiPfbLYkUuACSag1vTTILXOe+Wny+z5nhSWhf1j8LQ/qmbIrLOkTVn4DIrdFAcPfCtCiShqKHHw0vyXApEms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkMirT4R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkMirT4R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AFCC2BCAF;
	Sun, 26 Apr 2026 21:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777239187;
	bh=hhIRGFDgMyHb8qHPStrp0zkhGvc8+JYpfKJhJoTAMGg=;
	h=Date:Subject:Cc:To:From:From;
	b=NkMirT4RfEeb5R8pDjOqGbdD//pRfJvN0+IIyTnLsEc+8Hk8xiGaAWRc3eeVkEVwm
	 w748UGO4Iq/lbDFRJx8VXvXTNNnlujVU352owigj38NQm9EvegTJiugcke2AJbNkWN
	 vQcAOGFCp4zkxUA7yGj4P76aKdLdiMap2OITP5w9NbRb1GRzTxH2b2X4p5sQcRopW4
	 deImKdWJsRnCKXVCTlhFXhKkSebVcCTmzelN/ulmvSb17ta9pWKBjep3hNeS8Zuh4j
	 MKYx2ZPcFWUNDXoyNt02usw7MZktlEUqGgNrOoB3xlh/SIBN9CUxtWnDXdG3bLU8lB
	 zySfeY8PVxR5g==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Apr 2026 23:33:01 +0200
Message-Id: <DI3EPKNRWMQJ.17YVN5V0VBKLR@kernel.org>
Subject: drm-rust: process change announcement
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Lyude Paul" <lyude@redhat.com>, "Gary Guo"
 <gary@garyguo.net>, "Philipp Stanner" <phasta@mailbox.org>, "Deborah
 Brouwer" <deborah.brouwer@collabora.com>, "Beata Michalska"
 <beata.michalska@arm.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Steven Price" <steven.price@arm.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Janne Grunau"
 <j@jannau.net>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: <dri-devel@lists.freedesktop.org>, <nova-gpu@lists.linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2

As already mentioned in [1], starting from the next cycle, the drm-rust-nex=
t
branch will be open for new features at all times.

Consequently, all patches applied to drm-rust-next after -rc6 do not target=
 the
upcoming merge window, but the one after that.

Fixes for code that landed in drm-rust-next before -rc6 have to go into
drm-rust-next-fixes.

drm-rust-fixes will continue to be the target for fixes for the current -rc=
.

Please also see the updated documentation in [2] and [3].

Also note that commits merged into drm-rust-next after -rc6 will not be pre=
sent
in linux-next until -rc1 of the next cycle.

- Danilo

[1] https://lore.kernel.org/all/DHUXFAD38G5Y.6X6QNTANYNGH@kernel.org/
[2] https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-rus=
t.html
[3] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-=
drm-rust.html
