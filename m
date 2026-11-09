Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260031;
	b=BhhpkZt1V/y8nmSm2YRXkxpBGkDuxykva6tp4QWKEcxI1TcS9Wm6Woi8171l5a6nVZyK
	 iziB3bBuCSWWDl+32EFNA6cr91giQHVtPC9+hZ4jKWnVJm/pg6HKgKAsV8P7GCMju75RN
	 YmLFMc2QI6TA3QSJ0WciHyx0j8Hia5tQIOf4ZB0sSyvGcjxkGUogtu57NmlUs6W14NJN2
	 Qna8PmKR16l1Kgz0uUCMK0uDbXAxs0jM69KA69NXyfNPPgYKpbjAwz8rF6y65d74G/ClS
	 sDDagWvf6rDKh4o0tFbS7Ll10ZZmV1/QY7qGp/SYqxJY5xkwXVwmAdNZWx906/sDVuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260031;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TspYkeq/ltNSvbUw9A2uME+mbBcIwO89KXv0aSgqfzs=;
	b=Y6mmXlNxaW0pYUfO5a31xLTD39mkMYMgGVARa0z2LoFKb05lhTkZWZU/JLr8PsClXZ8S
	 Zo5M6giZ/V4iMr0BkR4+BLFnBA808V4fZZ7GVGIZtiXv78fv6u4gFkMrzsZP5JM4bRSBy
	 TrgTFsX33gHlLkeeLdkJvBA43ZMkCvPfwj6GB4Kpyaj1uQcn9zDsX3j+MjQUFoeGNHZ9N
	 HDKTreow/VnnqYFOpLUPyP8HUZSaJ8EwiG+UXgewIPWL1xzE4BdLU985OB7HKo5fZAhr9
	 QlFWmc/+vXiEMBM9gxDXNtM8xd7xF/Q0gIZC9jf7vC7GsZH31eUxIGH0pQH34K5hPNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hk2zmtRB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B638606A31C;
	Mon,  9 Nov 2026 21:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hk2zmtRB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7FC1F008A3;
	Mon,  9 Nov 2026 21:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794260030;
	bh=TspYkeq/ltNSvbUw9A2uME+mbBcIwO89KXv0aSgqfzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hk2zmtRBKNeqQ/yGAx/Di0O/ommbHKqI2xzUv008M55uhxL7R8/tUc3SdbhcTUnKs
	 v4jImBuc8VfMyMasLCFoIBTrK0zPqUStSBpl0asCuiVcKAysgQfO68sNQn+e7maPN5
	 b/8wYHD4zHsEag4ySC2Ww3QUYaOg6HXAQQP9U9awdYHOhCUuLfHcBqbbq/pW2kAW91
	 yt+ETo2itEQfvBfN751ef2ZnWvpPYyYFNBsp5RJMIttT+htx9F0QYNtKgpkGlI1eQ7
	 BWfcv3Gmzp7r0f0eCBK7MTR2bAxs/D7i4jKArs2X0fgblNkI6j4vVZZw6kdM6EvCq1
	 lJzef1WeJFpug==
From: Danilo Krummrich <dakr@kernel.org>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Yury Norov <yury.norov@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v11 0/5] rust: Add support for reserving of ranges of IDs
Date: Mon,  9 Nov 2026 22:33:40 +0100
Message-ID: <20261109213340.3944816-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109-chid-v11-0-082aa9bf5a91@nvidia.com>
References: <20261109-chid-v11-0-082aa9bf5a91@nvidia.com>
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

On Mon, 09 Nov 2026 17:32:48 +0900, Eliot Courtney wrote:
> [PATCH v11 0/5] rust: Add support for reserving of ranges of IDs

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[2/5] rust: gpu: buddy: use Alignment size constants
      commit: 1937c07c9f83
[3/5] gpu: nova-core: use Alignment size constants
      commit: a7cdb17ca0d7

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
