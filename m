Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259295;
	b=hbO39ud6/P8lB/ii3YVJQ77IZFmiTdHGXa1k6NW68TkyUD1oeSR0cleeiYIhAhVctShZ
	 zFmcCejLi7rXPk4ilWL/dKhxAIXnQNzwbMyfQMWOmTOW9nAAqx56L2gsSMoO7I8wnqztE
	 Bq57596HeGjlefqobHqygWxT2SPM9KdMBTMeV77xvq7hYxxoJIsRno2Q33WLou/1ZNkfs
	 cuHRvW6dsHMQ7k7RN5B1ZLzQl3GiRtGYB/0mGUSSvcnxkPARnK2M4YZjh+aqQV+YRUbm/
	 03RnjIK5ZAtgZjgCWwTdozR4IP7+fl2nvDmxLYfsc6rGFI8EpA07dJuw15F8i2zQU1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259295;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WyHVIDHJ/2Uw2pBXQmf2I1fjIXFBYI3F63G5dUMgJqU=;
	b=fXPZm27LAUlC47qSE8YrnByR/tyhRzIh3QS9IDE+u9NX8G6XcBi+VJS565siYHBgg+7T
	 QtuNQ1dXNbzUSD8mq1QBr9JqXu5xFeVGj7/sR08g0pVeWfmH27TAJCWP7R+bNKooAGh+C
	 tH+/A1cK8poUutRLKEFgZIRMHmUz3u3mQ6YAEaO5ttJs+kv3IjgErcy9QXils9uIs5YFu
	 XRhLIEJT2xFnndHf7p0NTs/+cmzttlVzdk4W5592Duq+OKXcw3Dw0AfJspADDaQ3CzSvt
	 vapCyh9O6NeuyKes7dG9CmNnXbSMRKOgfN61WNv71DJaFMRpGK3BiMX2XZLiyPVHAOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TFrREZdy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917F3606A321;
	Mon,  9 Nov 2026 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TFrREZdy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D781F008A1;
	Mon,  9 Nov 2026 21:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794259295;
	bh=WyHVIDHJ/2Uw2pBXQmf2I1fjIXFBYI3F63G5dUMgJqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TFrREZdyiw8ZcekW651SSuOQIbYIMj+/ysqqU4+XNdpaVGWHxCP7p3wcDCxsCgmJr
	 5Gfji6xGBYcTEQ2iKKcRLCpEfUjHg2dLeenL7f6NdYStMKgahaKmuqXEw+wSthHNmd
	 C3e2bqr+d9kZZDUai01yjMsB0T1aFCQBJ0SOFELXNMXns63L2VFarlePNTXqV0YhIZ
	 s9KY4+vfjqE3bWUEHYUiUrchvMilKFrmWejUS/vnshqu20xCrXr7hjiJnII9amqFgL
	 4gf4yg2IPdS4iD7l8EZ3Dep5i672wvJi/5qQAFkbQ6Slh1R3UJUbuypi93BNhziUiY
	 mzOlYZZud02Nw==
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
Date: Mon,  9 Nov 2026 22:21:28 +0100
Message-ID: <20261109212128.3911661-1-dakr@kernel.org>
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

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/5] rust: io: use Alignment size constants
      commit: 4d1f2b176df7

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
