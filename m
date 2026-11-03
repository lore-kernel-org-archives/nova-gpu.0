Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738854;
	b=DJaLghgvadyJiRlxh6MbaCLjTyB+AFkT92J2fKuKMySoEcrH6Io2BwnhM0HvulGF5/UZ
	 L26O+/S4dNoiSC+WzFVpqSXkQxysPSlTU1yk5SV9UonZdeQf0p/hxSL4sU1fRqrGY/U7D
	 DT8xLEWd/Fv3n3y+DHUWpmn9XRCcsylhI7RXnlpou2Cl/6S7lVBBcSCsKeS7UMJ6RoUrZ
	 M9bBbCtJhIKVkqvro/8PjDoLCJRM5wcn6mCr4WHAEP9A1zIFrzD2pWAg+zGXl2w1rCHCF
	 wg91CMQZabdvBv6cqT5OWoUSP2K46E+jixZ2c1InOBI48Cc2bjnOOBAmpZhWKqZzZow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738854;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CtgBDanjsD9iD2RTvWfEtW3CqZKYJo5b1NZUqI+Cpjg=;
	b=2U4ETlXnZyTnATAhJk9UXQS75VbgcERXdOUBGumT4noVvZyxhoHqFOEWV8GwZZAF7Pm4
	 JHk89e80Cy12uZFEYQQbfWUSc58KK4EeWM19duLdSndDksqv2DgrOnjL9qefpBv88Zb7U
	 G+QPTDkjVbFnDNGtlJ1YvaUDn7NjTIlmeAzaTNN152C1u+Raqr0tMIibM0WDOeQrmrvMc
	 MwWJuglZwQQvx7VJkUJEN//x9Q0f1nncvO8NR4X+KhdSDqfG/1ukMesoXDtpYAlVVHzts
	 1dlsiYRdbB2aGZCJzTmmDOn5PBVI+OyHJkIRJwiMUkulQUfEq+IUs4Jvr5wAtRKWZdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2J2pWY0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E301A606A324;
	Tue,  3 Nov 2026 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2J2pWY0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D2A1F00A15;
	Tue,  3 Nov 2026 20:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793738853;
	bh=CtgBDanjsD9iD2RTvWfEtW3CqZKYJo5b1NZUqI+Cpjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M2J2pWY0jhbLhVM9FKDXDNvfvUxC+w3Tq8ilF1TOQBv9TrwR06l6H5Oa83KooXn3y
	 2ccw7HSm4bfh47+EFNp1Sm4wf7/rztr9T5G7GOg0slVOD3ipBWd+1+8f9T7qpp19en
	 sZQt9xseIc5xALm/qY2ryr3sO55PUJwNu0KW4dCz0M5TpBQ4Bp5OfsjdUS2cq+r+JN
	 hDsbbPJAQzjLra2VMqYrmEwMhBLuHRQyirk0kJMjn9I4tEZC00kOMPr1wj8k8a/l4X
	 vnbUZxh1xr3ousr5v7LalHg6BMxp0j25DVOolg9IqzDCD2ytix14M78ewnR9iVzW3g
	 2JStyPXV7aSDg==
From: Danilo Krummrich <dakr@kernel.org>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v5 0/7] gpu: nova-core: add NVKV codec
Date: Tue,  3 Nov 2026 21:47:25 +0100
Message-ID: <20261103204725.4021673-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-b4-nvkv-v5-0-ef78909b513e@nvidia.com>
References: <20261028-b4-nvkv-v5-0-ef78909b513e@nvidia.com>
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

On Wed, 28 Oct 2026 11:20:59 +0900, Eliot Courtney wrote:
> [PATCH v5 0/7] gpu: nova-core: add NVKV codec

Applied, thanks!

  Branch: alloc-next
  Tree:   git@github.com:Rust-for-Linux/linux.git

[1/7] rust: alloc: add Vec::try_push_init and Vec::push_init
      commit: 55f9b4727cbb
[2/7] rust: alloc: add ArrayVec
      commit: a2a82cbb7334

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
