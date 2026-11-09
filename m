Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794189369;
	b=k3uY9aPeL1enGPqMXRuMIJbRMjGE0EgAAAHsc47LFKRG+zMdwxUN2ult/WLXhBp5T7DX
	 /l2OzRDbFig/GA8U8MjpQSlYcgzZZPy3y8PBRAE8Jo4TTOntSB7YoKs2Id7ZpZorTf+O/
	 e+2rijswFMFRpwUEam2xVdJ5OmYeIyvmmsyn90O3cOT9hA9JiM9veWmTAFlsYrbfCzvGK
	 wGMjV6LEnmb1n9Jq32k/y2uUc45cWuYM1TyG6FEJqTqJpRoQwbt4V3EM1VPDkTMdqkCYt
	 pDYVqz9xcxzPKgsbcHxqqydYiwikQxh6GP87rsOjdcgKhtYqGIlJU5+pI0GFcRHmgiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189369;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=qjBQ4vg6GcdDFRyG3Nfog2O+fXl/FPyP08iQf8cE2Eo=;
	b=IpsDgHIsN7Oq3ZQR8EFVCf6bcDAP2cc+veUAJbnLGfN83O4A6WwBZNXp5Sx4iGAQjC1N
	 Sr7W2AyxAGHw53k7dLuRMPMzAgMEsoOAnlQ+WW4SgNJLUiXL3mlsbPZ1RwnhCFzIDFzne
	 SFZpQcoXRcn4Z0XjgeY5MWuIQo0kj3SpGEOS+wxmpJuwyTed8Pj+wsuI81+bYz/J5092j
	 fQbITtRherGbk67oW9jrH8REObRv+s0hdZy9Z6moH6isru5RmSyDkmNfc7mDVSW3KGs3f
	 1g8iJniFM2Myb4WTcExTGpb2ght84KCFLSUIUHCtKSIvJGySykAoFWVnptmSszPeTMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z4Ujo+RD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3FF606A31C
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 01:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z4Ujo+RD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794189368;
	b=fRdbSTizVK01+6BrrVJRT46Y+szXfJ8Uby0phYIK1fP4DLlvLkmZwS9AZw9FPyOhUj2+
	 BlEpAJQr2R5NWcxHrEo5qXMiouyQmrxwtxK9xf1EryN879e4EFEkJdDHVVrfAPCI2s8rH
	 6OsiK1+89peXmQZE6ZcsOw5E2Bn9Cq0j5GWU444YpwXVOFECgYSdhAuIt671f0AbaMPNw
	 8mqABBVYt0yWQuSJbf0KjbUV/n1AhwTcsDU4md/W820odd3/jKAhm20gxnU+7W38rSl7B
	 P0r9yHYio96ExZ+liQzOXUIEtYiA+T/5WutdXImztYfuuHR/L1q7/qnarRrCU0wC9dg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794189368;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=qjBQ4vg6GcdDFRyG3Nfog2O+fXl/FPyP08iQf8cE2Eo=;
	b=EoKyT/rIndhc9So2FRXIiQ8oUc1YU2vbADyqTs+u20gTRF0IP1bFm7sNx/8p+gzp4nS1
	 z3uGxFGdkzuDRDTfjcBJpVctZ5o9Sx7i56+8N86icTzEBKDk3LmbjQkszKHZCxQFqyGAZ
	 6aFmYyyLrwgevasC48wIqo1mwdYkTJMDEO5BiSyB0DGQWO93ubwYTDmggOi1WWfbgcDVR
	 dwvvp42FsKZjzd02zAfEN9Gla8/kkb0Y7X9f1Z8yaC9yIsRX0Id/V1dzs06GuEG/OlWAm
	 X6ULXNhYeZMBwPxios8cUSR/EkBhPxySQWq0dl9Wpq4jBVMmf8TVV3Xyc9IIM1kmkPA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B0D41F0089F;
	Mon,  9 Nov 2026 01:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794189368;
	bh=qjBQ4vg6GcdDFRyG3Nfog2O+fXl/FPyP08iQf8cE2Eo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Z4Ujo+RDeuNkJUu025xFAz05PJckt2iLSOZPvMwIslNYYZtlwOWLwr3+WHUC/gKSJ
	 xcgEYqy1et1XPTkM/NHcoP1ldO/m1BkF29+7OqfXD/etdIyD91sw8zgtVItq5/1H/d
	 KLtBRrErdee+bwa4SsN8YLiaOeRkQj5zQWamiyNGMjcbAdri5I9XXt/efJsz33k0jO
	 Uj5ercEFSxM9ZePtmCyiaZEjVlVqFfBcxrWmjFyDpRXhHga+9Mzgl5x79t6NxLxf/i
	 zkfXn1ytAVg63VS/Bq7V2hzG3kOVbOLXVQDXdBBGEEhKfEFUqkA1OzL71h2cMsuOg+
	 2moIQe0Pd6EpQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1615C48203;
	Mon,  9 Nov 2026 01:56:07 +0000 (UTC)
From: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>
Subject: [PATCH v6 0/2] nova-core: add initial support for gpu timer (v6)
Date: Mon, 09 Nov 2026 11:55:57 +1000
Message-Id: <20261109-nova-timer-v6-0-5544a3bd8b28@redhat.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MSw6DIBSF4a0YxqXhcUHtqPtoOkC4VAZqg4a0M
 e696Ehjh+ck3z+TEWPAkdyKmURMYQxDn4e+FMS2pn8hDS5vIpjQnDNB+yEZOoUOI/XQ1A6lKMF
 wksE7og+fLfZ45t2GcRrid2snvr5/M4lTRhsJJRqnAXR9j+haM13t0JG1k+TeyoOV2TLr66YxW
 Hl3trC36mAhW1CmtFxwBw5PVu2tPliVrWHWCeUlIq8OdlmWH0zG/YJZAQAA
X-Change-ID: 20261102-nova-timer-f4b9de3274a1
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Gary Guo <gary@garyguo.net>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139; i=airlied@redhat.com;
 h=from:subject:message-id;
 bh=58uDrof2lXfwgFKv4lkz79VwDp7ch5NW6erIJginW+k=;
 b=owEBbQKS/ZANAwAKAQx081l5xIa+AcsmYgBq8SgxbzAzC/vkgvo57Ut9h8pVYRlJxM5p70MfQ
 C0TkGeAuxCJAjMEAAEKAB0WIQQQptkdobBb0p9t66wMdPNZecSGvgUCavEoMQAKCRAMdPNZecSG
 vvgREACJ4gM7F9/nIXF0y01cro2sv9TaG6+LEmRwfx4B9JiVQg9QXdzMgz7Uw/BwLnG1FReCKZ0
 GVjgKJWR5Yo/g4+ViW94rqrmClK73ajCTUMlWMNC0ShmR1FhpGiJkoJfmbgjjqgedabSbjhgB8r
 kxC7UcMh82OAIrRdUi278AR4u20V4OeAFuRwdjenahbcfeTnQEjR/qtR+BocVQP0gPDMOqey8wS
 045JEPf/6dwIm34e0QneNge4/9Xyh1OZxhlcK+g7475jyXufvbsLELtLfAAr9XCqhk8XOnLTTun
 vGu5sQxRY9T7G/SO/2AEbG0aLl+2JTu5TYlb3llK1McHnEKWiAJDAsjaUJR0z9KgPsfNk0DrOJg
 7Yzl7qF+SawRcrl+W7QeYrxCmumrwNp44V9Pghvyj9Ng5tqt20xXP/OWqeykh3kTPp9yvAkR70+
 yBIDYVvg6txY1kOX4PTkrzTeeLC2rkPe2XyIjxR6TKQCrrs8vUCAJe7jL3Pkj6MPrInNNBYx5sq
 DvoXcMfcRiipTmfnWvRa4AY35+6Td49IDpOkKTJW/76xh3VliULARmTjyeDrhiBKYz0/w0qxQMG
 YbtNY27HDvK1//y3ux/kbcU/m3va1ABdGwE+tlYriYp07kLgaqrrLkGWensdpAacoIJIotQMVit
 5mhmc28RbLeaGWw==
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

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
Changes in v6:
- Alexandre's review comment handled
- fsp hal stores in fsp
- register cleanups
- Link to v5: https://lore.kernel.org/r/20261106-nova-timer-v5-0-a0cd25f3ee18@redhat.com

Changes in v5:
- Alexandre's review comments handled
- reworked registers/workaround logic into fsp
- fixed all the timer register handling to be non-falling.
- Link to v4: https://lore.kernel.org/r/20261105-nova-timer-v4-0-45a7c121d4de@redhat.com

Changes in v4:
- reworked register handling
- used a timerstate.
- Link to v3: https://lore.kernel.org/r/20261103-nova-timer-v3-0-0cf9bbae8fd9@redhat.com

---
Dave Airlie (2):
      rust: time: expose as_nanos for clock sources.
      gpu: nova-core: add support for GPU timer block. (v6)

 drivers/gpu/nova-core/fsp.rs             | 16 +++++-
 drivers/gpu/nova-core/fsp/hal.rs         |  7 ++-
 drivers/gpu/nova-core/fsp/hal/gh100.rs   |  5 ++
 drivers/gpu/nova-core/fsp/regs.rs        | 31 ++++++++++
 drivers/gpu/nova-core/gpu.rs             |  8 +++
 drivers/gpu/nova-core/nova_core.rs       |  1 +
 drivers/gpu/nova-core/timer.rs           | 38 +++++++++++++
 drivers/gpu/nova-core/timer/hal.rs       | 31 ++++++++++
 drivers/gpu/nova-core/timer/hal/gh100.rs | 63 ++++++++++++++++++++
 drivers/gpu/nova-core/timer/hal/tu102.rs | 41 +++++++++++++
 drivers/gpu/nova-core/timer/regs.rs      | 98 ++++++++++++++++++++++++++++++++
 rust/kernel/time.rs                      |  3 +-
 12 files changed, 337 insertions(+), 5 deletions(-)
---
base-commit: 7a6bc132f1b51437063c9203e7221067b40a791e
change-id: 20261102-nova-timer-f4b9de3274a1

Best regards,
-- 
Dave Airlie <airlied@redhat.com>


