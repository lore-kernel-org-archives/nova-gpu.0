Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793666035;
	b=zaoJQ9hvnzRPlDpxkMMgm+3/+OhtEgtw/17Sh7zOoTS2NlDHR7uEgVylNqKLhtkRkrQz
	 d2xvW4hXUwvgxBppRF5yJEa/w/jYd9DQr+wusCknhzMIy9uSWite4qE2ejwcV3+1Fz7WY
	 KcubJ16PFPCmNuNOwA0Ya/r1QfZRHs6PgCOsUizfGpcH/Nnk5H05Q0JRl0IlfwIoLgdwu
	 +Jwgjj67dz6qX1UpQrqjZwiw9ZUA/uOfpDtZ3TKC0lbkwVwksTWglFwHlneZ+yv1lfivj
	 CEWuZGgT76lgrUOXqAKcGOvDofKzfBvMjpvckRns2lHy/LeuVMVkMlM1nNASWF+gu+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666035;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=KVXk6lwGMIenEygQn+nLHr6jMS9XQizkHf7Nf4xFaqw=;
	b=vkHL16m4AyXc/7yg5fYG5UQpcjiAEvqFkm80b6NSpx8PVXKWkZ2W2y6DoLbaco5gZTzZ
	 te4u+LI/fESkz8TPMzj015EuoS6YyRAo7LhGiRqf9oJBFBeb+9BxLPPGpr5mTQqoacusr
	 7TfHLTMTcwkSkzEOw8VrtwfkhHXTjTQDAfBxSZEk3vEnZWhh2UCrkEr4PR6zDUlKsXjnz
	 5Qy112+cHnpxAk7Q7ooyLte8/xh9FhPSsGoryJkii8kZ22e9KcuFfP0siB3EsfPhwq0cH
	 EBm9w8PZF4m43XjGFsf4T8EkpRJM1utlG5XjxeK2/eh3D/2bpDw08kC+JdTyXGwilXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GL2H6MWS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E5A606A326
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 00:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GL2H6MWS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793666034;
	b=uIMJDtBzsXAEyGhYyM1K5r8ifw6bQRkcPUhz8R6djqA1nv34fXzEeIAHLr2yAwBVzoT0
	 jJZuEy/R5tk0UC7g3OLbk25ZtPp0BpBpY44wOEbaUyLw+8XQgexNAc3jWUmMBKhIFa6w/
	 PYgBlGo45w+YBFs6EnDZsfqD1iNeKH60TPBoutw1zEruUacch3VbfMefL8xpsdR0lSHfJ
	 IhOPofO0PA3ohb3ukyQoJR1w+1praXWJvrgzNWMmMSzYkapz5XX1aADliEdbgwB55pzBS
	 Ca9dS4JdvAh9q0n3nCPl0trPYhdpb66RKY3juDGyU3+aTzkIMziaz9WVsUYPiuRh/FA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793666034;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=KVXk6lwGMIenEygQn+nLHr6jMS9XQizkHf7Nf4xFaqw=;
	b=r8m2SCse79MNehKMDMH2xfT1OnjDVsDxMdCJhoE5lqqger1ImjkeIe330u5+h1nFD6vW
	 azuhVVYNyG3sQl9vEFxbSIeYM4HlDOhagPz9uFiudEIySEgiABUkwmF3HqX2hJ7dJkt3H
	 P5p4LWFRtEUNfWC6M1h1vihi2gDeNx5E+0D4Nglp48bFs5Z/UYcggYmRmzhRHt+RJF0sL
	 pVzqbAECTLVXK/gqSNERpxqO6L+RyWg4GmaqtqeLS4Q9Uq0V/Vca7IO4q4yixb33+mQux
	 0Sesy3suxSAXnKdLXW2s93n/gYkBQCcq9KA+iL8rnuyxKPoANiuOh4EtK/zUH/0nA7Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F2FA1F000C1;
	Tue,  3 Nov 2026 00:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793666034;
	bh=KVXk6lwGMIenEygQn+nLHr6jMS9XQizkHf7Nf4xFaqw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=GL2H6MWSgCA56d500Ib4wIp30zuj6SlzsOmvgNhPN0Lpt0RWkOnR5oZa5GTzCry8P
	 iFOrIl2JBUkjIWjWTqgepIOR12SRPb9bPcgMqqLzNgGWVb+sVPbmBUvtcM5RoU8IRB
	 sdRWwEXsu7V2SggbGcer3j4P66X0bGOWHBi6AUlZRAHYRV6QIPofdu6HI5n2zyfF8U
	 8NCSeKgvdpVjYe1sgKLVtb7K90Gai2jUbr6d+WhulMaMaecTq4LlWmwipkpzHdkd9S
	 Kk9Y1taglCuiNZpEgzVAOqEiSPEa9vafTh5zgWojV3Mwd/Swc75Cwn2zlg0jRkNb37
	 /4ya+2oeHLd5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0192E46718;
	Tue,  3 Nov 2026 00:33:52 +0000 (UTC)
From: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>
Subject: [PATCH v3 0/2] nova-core: add initial support for gpu timer (v3)
Date: Tue, 03 Nov 2026 10:33:37 +1000
Message-Id: <20261103-nova-timer-v3-0-0cf9bbae8fd9@redhat.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MSwrDIBSF4a2EO67FF4Z01H2UDEy8qXcQLSrSE
 tx7bcYd/gfOd0DGRJjhNhyQsFKmGHqoywCrt+GJjFxvkFwaIbhkIVbLCu2Y2KaXyaGSo7YC+uG
 VcKP3iT3m3p5yielz2lX81r9MFYyzRekRrTNam+me0HlbrmvcYW6tfQHxVKdNpQAAAA==
X-Change-ID: 20261102-nova-timer-f4b9de3274a1
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Gary Guo <gary@garyguo.net>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387; i=airlied@redhat.com;
 h=from:subject:message-id;
 bh=t7d6XO1s83oTsDc4sW8QAhQzijhkmPTiAZ/XbGhxRA8=;
 b=owEBbQKS/ZANAwAKAQx081l5xIa+AcsmYgBq6SvoQcfmiFC2yw38Q4WVTNNAk0PEbNSGki0W0
 2p7BwUy3GWJAjMEAAEKAB0WIQQQptkdobBb0p9t66wMdPNZecSGvgUCaukr6AAKCRAMdPNZecSG
 vh/gD/4/hCZ2P3R7qqGOCCHDBfGfpzdpFAFrppHk7c0si5wQqJGP4U7y0vvl0e8BwyQlVJeh6iJ
 Ad8G2RVlyg5TvRaEso+e+b/DbMApTXnOmBT+aKrrFS9lsNVW70lALThqs6rMOzVq6XXX8vYBxYv
 8pVieFx2eMTJ3xXHial9BP7KydXEMT6wQNKd4Eo6hkZRgg3ODwYJnFJOAudRIPj9CsHpOhi5eA3
 OcPcj6ZpRqb3O78KgkKcjkFqcySXMglp/TfC+3H8+TwM9AUwIxttbG8AuUn3KgA4zyqgyRNiYqt
 i6tEWSwgzFXHMzO5vN+Fby7iOW5b312sO9bbiDFAc1L1l+E1JTcTBVTYUgkYzpm3UF3Mf3TK3ZT
 0QJ8pZsnfcZtPvBS/EFpNrQDGr8Fq8EglcZezG0og1h+2H5RnMOnrha/tB3lC3OXixt497UIn7C
 2WK02l1afv3VpEkpJcCjPwcTvxoucmaCrYnghAZA4qNqbEoG27K3DjXP1JJo/59jvpSI4DNKtpm
 yvOK5FGV20aszksXzYQexJt1JYOx9ZCYqo5u66BYZRwjA2EAFfpf6f9Zzy0I/Tlm8LY+e3JiE4F
 xGyaKO31pF9sc2OkVsS7jLA6BUNBJWc4s9J1D+fXoB8ic6lkdHMRAMSDUKTyrGMlW4y7RKDDOF2
 dL5gdfHHVnQwNsw==
X-Developer-Key: i=airlied@redhat.com; a=openpgp;
 fpr=10A6D91DA1B05BD29F6DEBAC0C74F35979C486BE
X-Endpoint-Received: by B4 Relay for airlied@redhat.com/default with
 auth_id=1321
X-Original-From: Dave Airlie <airlied@redhat.com>
Reply-To: airlied@redhat.com

The GPU has a timer, one of the pieces of information
we need to pass into GSP init later is the timer offset.
    
This series just adds support for setting up the timer
on Turing+, with hals for Turing and Hopper.
    
Right now it calculates the value to send to GSP but
the code to send it will be added later.
    
For some hardware variants sending a proper value
is required for GSP init to succeed.

v2 changes on second patch.
v3 fix the WAR to be hopper only (Sashiko)

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
Dave Airlie (2):
      rust: time: expose as_nanos for clock sources.
      gpu: nova-core: add support for GPU timer block. (v3)

 drivers/gpu/nova-core/gpu.rs             |  5 ++
 drivers/gpu/nova-core/nova_core.rs       |  1 +
 drivers/gpu/nova-core/timer.rs           | 33 +++++++++++
 drivers/gpu/nova-core/timer/hal.rs       | 27 +++++++++
 drivers/gpu/nova-core/timer/hal/gh100.rs | 94 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/timer/hal/tu102.rs | 55 +++++++++++++++++++
 drivers/gpu/nova-core/timer/regs.rs      | 64 ++++++++++++++++++++++
 rust/kernel/time.rs                      |  3 +-
 8 files changed, 281 insertions(+), 1 deletion(-)
---
base-commit: 3497a403264b094ebd61b8b755165d56e7d9dc37
change-id: 20261102-nova-timer-f4b9de3274a1

Best regards,
-- 
Dave Airlie <airlied@redhat.com>


