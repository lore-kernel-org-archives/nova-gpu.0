Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283031;
	b=iYdnog95rPeQYxoBRiHkzY5VeZRXDcy/WmfuxQ9L8AM+BqsWo7Kxlaf3pQb28hhL8Yka
	 5j4cUpjDUrcy67UFWMXo8ZTmcgJgIdS3h9SeSMegFrfEJY0cJkgsV5Hp1EzhJf9pfvXX7
	 EgESPzZUMHW+luE56YzH6cfCQkzdQCK4Q4hOEO9CyQFcTeRKafSBYshr09qtTuSA/5oT+
	 D2F3kY2Ob+EN0QbLHkqPkadryPA++0EzvIb7+Ytft3YbE6UcKcjmzus6DgZdNQy6kEtuW
	 DQ2QYEyvFxfnC72fB7txZGypQb9UERMIrTyiLmPU1ippmd73eiygltUF8kPZM/Mqp7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283031;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=udZYC2uR6LZTSAolq679zGOSTIouPHY9Kp8cjPhFlOE=;
	b=z+3jJW7eguWik16eJPO/Ztp2eqwEDW03DxWwvE7Ogh/zDOIy0w+4X9OxCXzwzUvM2z44
	 t5TSM+23sUjia+LT6FCwN7jl+wchddHJTtj5fcckGFlPPMClF7LGmEOeQ0aUN59+IaGQq
	 UTbSduDMpPHeQSr1fvRJuF4jMHvmKBH+NaspVNS9HY835UfJoC1un2W712Qzki1+mgqyD
	 28yUcb3cAlWA9YZ8xP/fF30K4w2ZAZnGTMyMATRgysW4Wli/ENhDAn3evCmVNE+XTj8+8
	 oqKDnWhx0UcS5dJsTmStpcLBd7u8iGf5O6uTPPjfvJCkC16DFIowkEoG4lOaXG1cbCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OFxfKRUq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9299D606A32A;
	Sat, 21 Nov 2026 17:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OFxfKRUq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADCB1F000C0;
	Sat, 21 Nov 2026 17:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795283031;
	bh=udZYC2uR6LZTSAolq679zGOSTIouPHY9Kp8cjPhFlOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OFxfKRUqQ/rPfpfzPrGG5zhws5OxiZuH6d6OH0IuJUHatAWD3K8AlrVvOdpjT+ty0
	 SlDoKsjA+9hS7LzQSJBDwCc3Iu729GDBecB/KERnFIlETnUdF53DL8naq2BRfZZPxy
	 BM37Vn/numrxqjVnS1mWNozRPt5ncjPcDff6HLwK1NrgmPM4A//11Vyp3MFPaGDfwD
	 wwI7OsqRq9NP8c9l16AVk1cHN/2b1qHztHah0i8X+xC23OcdCEFfy99R4Fw9AIuAtJ
	 1wp3Aq18jjzUgS88yLuS+fMrzAK33FpqFlTy3VFAeQzpoWCMUZ/D7UXaI5cu0L69tj
	 YxPUFb9VVb0rg==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: drm: remove DRM device private data
Date: Sat, 21 Nov 2026 18:43:45 +0100
Message-ID: <20261121174345.29747-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118181245.2583303-1-dakr@kernel.org>
References: <20261118181245.2583303-1-dakr@kernel.org>
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

On Wed, 18 Nov 2026 19:07:35 +0100, Danilo Krummrich wrote:
> [PATCH] rust: drm: remove DRM device private data

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] rust: drm: remove DRM device private data
      commit: 0694e2390c5b

      [ Assert !needs_drop() in drm_driver::release(). - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
