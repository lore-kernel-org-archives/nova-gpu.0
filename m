Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739038;
	b=bLet2oazTa0bXrGBcy63EmpFV/+zhe4jf11o4jDq6Svhp5Bee9A877D2dyXq2aWiHuHB
	 SiOJBwGpb/JMNOMAslnPKjuvTK0/jclS/+GULQjYG9szN+6+Ylp9w95PDtzfD4q+klptw
	 0vokvsAPQkOGHRSFUQXU4MxpXgEK+AFp+lF3I2ipWsRSOZnyFLKizdE5T0iX8p5fyDMi5
	 Tm/iNpdycc4EgKltHnGvMrBbsZz/1wr3QrV9GONMlVb4h3sqwPFI3OqL6N+iPVrE+AYXl
	 rOgMzwebfwjaA+XAh9wX8xiQ14yKC2e0mLNn+AaRZTNMp4YNEKXoTO9Dk51yOflQDkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739038;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QACbzjj4ObeQbuqI2hJvuEcx06fQf+krQtbSCsJZb0k=;
	b=XpApU/nqek0Y5CPxZ9adX2WZC4dywqkCcRBLDVgS0U+ZELOIBIvj6O2arfN0D/xTkww4
	 3yyvQMQ1IztIP8WXm5ZPhUMnpY2WL42hwgYy0SxXKAdEdhyYSfzhrgEJMnbs6BqLEWAP3
	 LlR7/D5JY8st+tyqq/WqMR3RfdkV71QoEpYhbd8LYb7emFKux4RGeyTbAUNo1mKYqyk+I
	 44LL/rXKI+qZhMTbC8Ix+y2nIoGJNgq5Wvdl0zck3iXBePdM1a98jzmjSgktIzSg3Rlpg
	 NGpUT+4FJ0ecZHA5VYIsSixnpmvmIevpUWBg09WCG4vIaOdItsTOYqbWMnpAHY+HLKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6tpNY9S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB59B606A324;
	Tue,  3 Nov 2026 20:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6tpNY9S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5971F00A18;
	Tue,  3 Nov 2026 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793739037;
	bh=QACbzjj4ObeQbuqI2hJvuEcx06fQf+krQtbSCsJZb0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b6tpNY9SjUxExsTeEVkXslwJk+qSf6s3N9FRFYTRE2xZuEn3QCQLRfsDdU9kutrv6
	 yb+fOmwAyHderbawOjBDVsCxafa40RDj35JilqYKK4YdBk2llO2de3WrU48uEO111q
	 vCN7a9McqtEg0aDrZpjVb656TXxKjtySsHyIp3uO82OY+oJu4JTijQClbweGllfKVl
	 FJPP9Kf9ilbi6RCOWvwVNEl3vDSD/kfQVDk/LS3jeag58ftovEc5ARA1tSeZIAMGI9
	 1rs1yRkBnpr+ys7gOvtL0TlpDuHg4++ZUBJQPEM84m9A9S/uv0cpj1ZFosA72qozs2
	 legeE0ukalxAw==
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
Date: Tue,  3 Nov 2026 21:50:29 +0100
Message-ID: <20261103205029.4026128-1-dakr@kernel.org>
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

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[3/7] gpu: nova-core: add NVKV encoder
      commit: 440b82a79574
[4/7] gpu: nova-core: add NVKV decoder
      commit: 9898bacda71c
[5/7] gpu: nova-core: add NVKV typed encoding
      commit: 75e32e6e3573
[6/7] gpu: nova-core: add NVKV typed decoding
      commit: 434b46a415fc
[7/7] gpu: nova-core: add NVKV GSP_INIT schemas
      commit: 41871f4ddf71

      [ Fix minor merge conflict. - Danilo ]

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
