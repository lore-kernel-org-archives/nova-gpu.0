Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487742;
	b=5L3hQa/sLbTgtIElD7CjYPh38FhbXr6HgrrPQ6XC+mMrK0C2Ag3vDOGm7H2/JKXvKjNN
	 jytHDA6rRMVC/EtMGDGOYjtIZBifxbf6Vc7zFIj2O+WKnLm+ZfGcEl5fReqqYfGSALO7E
	 ZuVe1kf6q2+Y7VM92PrLf7AECupeloH5IZjdDnh9OQ6P1Xy6+E0nhfph5MNEtkLMV8ix9
	 PK2f19Wm59BVG/KArYuFN4fb+FIVt0CoeDUspAqgQAIiLFLfTIoi47I0DP3L/z3bKFa9Q
	 6ndByEEZbrvkeyUfBRJjX1tQjOB9hS7fNMVYnxA4HUeGLgeYSDOPwYhkxPoF0geLU9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487742;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=bbjvxGLiLRjOuG6IBi4zc6utgaw4kKNuTIsp1Xrqk6w=;
	b=ukY2jwZ5cJns/kfN00pByg90V0y+mQjtaL273v4+qhKTD6Akw/TioQqT691UkZtLpMlQ
	 l6z8pUVwVitHMPRlNU1XadjA7YBxUl7hdqaw4xNt9uC85M7b9jgurP8ZYdyh7Kufzn9Il
	 TSN/RPMUctl6IpKUlZ6YK4GVJUxiOyE7wMj6ziFOHupDMZmEskO3JQno9OlmDZVx11owi
	 648EARdT3joY21+yMgbJjYaUxyKEh9vxO/XSQP9SplalesiwGqlVgRN7kOAtx6RAEwfbE
	 PUGrBGRjG9nXjVmUjxQoIrnciRgByZapFZA9K0TyVRH8VgOvfL1Eb2O6opSCBuKeqXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAWINCEw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158FE606A8AD
	for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 12:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAWINCEw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E041F00A11;
	Thu, 12 Nov 2026 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794487741;
	bh=bbjvxGLiLRjOuG6IBi4zc6utgaw4kKNuTIsp1Xrqk6w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GAWINCEwiJD8jcm5yD9Vrz/j0mBmmXq6zDjh9Bew2Bhq5Hn13ygGXHboKycvyI0zt
	 L7FxNyhrqe3H3GIzQxQu4Q1jhvzjSaCalvgTv33JBkizmZ03GGlArIWXONnwa7ygF1
	 n76fdEcysWtV8P+T6Ek4Vi0nuVvZBpFN5XB8uOGc0yEg2OQIfYYgTJ7LMWjmFI6xQK
	 LiM3nRf/aw/vGj1uSk7ej8VhmTzX+786rpEBMShQN1/W2/bZaaDAZb6dsIa658bRwU
	 cNqA1endGQgN+U2u1sx5xVoPLhzr8SxA2Ph0Iq0ICrJ3ejStTaS8wZgOaJZzFlwhEF
	 V8hJRL0cQKGKQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20261111-nova-timer-v7-1-3031c2476551@redhat.com>
References: <20261111-nova-timer-v7-1-3031c2476551@redhat.com>
Subject: Re: [PATCH v7 1/2] rust: time: expose as_nanos for clock sources.
Message-Id: <179448764517.621816.16006004780926601543.b4-ty@b4>
Date: Thu, 12 Nov 2026 13:47:25 +0100
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Wed, 11 Nov 2026 15:23:24 +1000, Dave Airlie wrote:
> The nouveau C driver does ktime_to_ns(ktime_get()) to program
> the cpu ns into some hw/fw, so allow this method for rust drivers.
> 
> This is needed for following nova patch.

Applied, thanks!

[1/2] rust: time: expose as_nanos for clock sources.
      commit: b6437dcd8958440fdbf05a957d8fdfb7e44a0b5c

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


