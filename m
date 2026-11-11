Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794374613;
	b=Goslr6XxhvOK1O1ZS3tvo8bm3SlbQb2zKz2BDHBfleGpwlaQECmlahYYSdaYBUJmoOhY
	 1ZWOc3yoZyvBJA6VrQgTGY1y15cDEzM5/MdtddoG+QooLyRydPS5YUDL89Nq/iy1sUCIY
	 yygAENnsGHpgIu/vbRnhpOwYJXLzyLMVtgzGdCsUpozYZl32F+kyt3gp8xWuxtZFHv6Lu
	 4XlGhzteHb19SLijxHfyqcvOWjtbTZHl/5bCzkQaOLqwS2SoHJ42shV5xIALdY6SpkUkD
	 J/fwiY1o/VNcN8RVGmGbLeIR6Vkucacq2diNV/V7fP9yjZ124GSpDeqUfn8FEmpHv6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794374613;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=lPaKkWxw5DknIUqIAT+t6DJ66krLuctTrkqCq5x65kM=;
	b=uemYXmqQ/KqaXVqImJ9cCkXdj9pr/levvcoUVE/JE9AEpiQmcxKmswXmcymrqJgpYWOE
	 c9Dect+bi03l+w+ERTSZYH3x9jtTtt3sTMralkbhJmIHOyMuTAXG3Jv4/BI75hofMYifn
	 VRm30IIehDSM7fkdme5Lmf3DlRUYcWqaAxrselsC+xEW9eAzojPx2VN/s4DNUuW0d8d5Y
	 kVuccHL6fhkpQqOv1iyuq56QQtqoVNCAMIF1ahCR2ESHdtmZIMvKaPwEljgOUeUoGtYYZ
	 NjEPkkTk/kzU232uMLrgq78YMgNY+eWAHPvQ9gQ2kQP0RW7FweESk1ECRJbCFNaWtkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=id4prybp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33362606A324
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 05:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=id4prybp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794374613;
	b=Hw/T9qO0Us3Gt5gbyHSFBOGOvZhBHmn+WMcHbxK14IuUuyFF8dglq3ZX3tKJZyyDQR3v
	 dbasQ7DggU9Er5jaM//E6cegKtiTFof0XHS723znRj9g8do4I/BOv2rOkGKs3sMC74v5x
	 Kst5Iao/8L8WLFzgdxv2lJXrcicOLzWGlUH1tW8MwILhLEMO+y9URRVcQFzGZwCUXRAG5
	 hEjFqNL84BUsrQH/VqPjj73Vp/FZwZJF/Li7ytflg0jGvay8akD4CyQzPxysPa+5mMS0u
	 zJ86mqYb/LdZXI7lSdiyS4ghvO5fFdICiuM/WdjDH1uAiY4G56rkTxV0FDRdUEyo/AA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794374613;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=lPaKkWxw5DknIUqIAT+t6DJ66krLuctTrkqCq5x65kM=;
	b=ZMkQopOs1/Z5p3xVh1p+sUi05gLTVUQv6ZHDnW/cB2I+DbjfNSM+EuYGlJXY1FBcBSQk
	 N8ttBt15n+8UfXwk/uxqEbGgiPT2H7vR6f8ygnyT0GF0TYeTxc9rX0XJCEinzaTnRSm2Q
	 TU3HzetUHI9jK5Y6aTI0kfPBAE3zb0Zl1Z1XAsUzv84LP1daAYE6gZMeeFrPsAhpIBjRs
	 WkLFsfLoqsCI0p1irxBFB3VwqdXK9f6LAIQJPSxJt6lIbx+GTOXnLpTI5SxYfP2bEeK+E
	 W1xVi5t913ZoIAd1uOwWPR/u2yXQ7uB93FNaQpTTOYXG5drD/OX/M9cVQQsMgYlWqlg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D60F01F00A00;
	Wed, 11 Nov 2026 05:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794374613;
	bh=lPaKkWxw5DknIUqIAT+t6DJ66krLuctTrkqCq5x65kM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=id4prybpLCT9uRfp1g5EOTslsr+USLZ+vX5uH48hNdZm1TOtzWoPOk2eyzNCqTQRK
	 wUpWNDWimocXU2IU3SEFzoZeh6uO1IUplNVP0dXkW+HaD1VFWAsGRYajz3XGtOunk+
	 sn2F+FI+d5I9umf6+L74hTWNrYkdnVVlYtc/I3c/caLOV65skAqLaZX5wrgirM877u
	 U6QKt76r3fgSeelcET9DX8q0gDF2A7S0vrv3iHw6YxGb725gxMi2JWvAzbE1pRFzsz
	 L1J/QCRbH4nZQXQ0YdLR+QUOGw/UEMkTwvPHS/kWrBq/IXv/0bo2r2hQNFMjmaYZ08
	 i3MHFx+jS7Wag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3870C48DC0;
	Wed, 11 Nov 2026 05:23:31 +0000 (UTC)
From: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>
Subject: [PATCH v7 0/2] nova-core: add initial support for gpu timer (v7)
Date: Wed, 11 Nov 2026 15:23:23 +1000
Message-Id: <20261111-nova-timer-v7-0-3031c2476551@redhat.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Mu47DIBCF4VeJqJcVlwHbqfIe0RbADGuK2BG2U
 KLI774klZG3PEf6/hdbKCda2Pn0YplKWtI81dF9nVgY3fRLPGHdTAllpRSKT3NxfE03yjyCH5C
 06sBJVsE9U0yPT+z6U/eYlnXOz0+7yPf7b6ZILrjX0JFDC2CHSyYc3fod5ht7d4reW91YXa0Ic
 fDeUR/xaGFvTWOhWjCuC1JJBKSDNXtrG2uqdSKgMlETyf5g7d4OjbXVGgPgtMfeq9Zu2/YHqNv
 vtpUBAAA=
X-Change-ID: 20261102-nova-timer-f4b9de3274a1
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Gary Guo <gary@garyguo.net>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2362; i=airlied@redhat.com;
 h=from:subject:message-id;
 bh=aQdXRoN7clljpU8JEsQNneCbz/wWT5hjhffovrOERe0=;
 b=owEBbQKS/ZANAwAKAQx081l5xIa+AcsmYgBq8/vNl/cI6SPsqeoWBL2b95C3a8hMPEtHUimk5
 t+agOfZCX+JAjMEAAEKAB0WIQQQptkdobBb0p9t66wMdPNZecSGvgUCavP7zQAKCRAMdPNZecSG
 vrT9D/9t3xI6jF3ymxIYZKf4n75hoKh02+o8TFDQebeJV8Y2BRunE6xczFIsl0N9jbctIITpLfV
 8eWw7cz9Rcr/1IxJQmwuWexbqmUJA7xzJaCtNhZuS9AxRiDbw3+bGaU4SSKoDqfzNsv5WitmaSX
 CInLiQ+nXh8XbHNv2H7GU6saSassH5xr+rgxFirJPiUATqhKZncRQnSQFjz/OBPVeLL24gplB6G
 6O4klRYr3JbE+Ih5pVJ4gbve2iOG+78aBLd2poeebCOGi2pFiH0X8wrH1Tb3KllPHuQnwQ8WSZY
 jNVaGZSHG0BQ6QhBZOLeQTcaVF221N+Hd5P7Xy+ZXvIatMdCG2fomgCSeiukz459i5LSblPG+CX
 Oo3zdfy2/1LNWwaBmzZUl3kZmjRsOWDFEbi76YjoGXVM9KGqs/VNsYpdVHXTrzhJhhQP/jiGvET
 uUNrcyD4cBhvzmmsCInzv/9w3lkdNkiR/Uxh618fGFzU9qvR69xwknor138YyhWB4b37O6Qk9uq
 aMOfGh/6PuGdijV9An4FxWN4fDL2O6yP8EXaM2ldNub0fHPn+8OcKihZo22t87Xnsq9Rz/ZfsVd
 YWqd1xD2wbB3cUyakdCfwZ4G7pPoG05cOcIKOIpp5P0Wm+UyVNrYEUCd2AZyAyd2c8KbrN2g+DP
 Eg6WSxjJoPJfFCQ==
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
Changes in v7:
- Alexandre's review comments
- fix tu102 non-fatal just print error
- bunch of comments and nits
- Link to v6: https://lore.kernel.org/r/20261109-nova-timer-v6-0-5544a3bd8b28@redhat.com

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
      gpu: nova-core: add support for GPU timer block. (v7)

 drivers/gpu/nova-core/fsp.rs             |  16 ++++-
 drivers/gpu/nova-core/fsp/hal.rs         |   7 ++-
 drivers/gpu/nova-core/fsp/hal/gh100.rs   |   5 ++
 drivers/gpu/nova-core/fsp/regs.rs        |  31 ++++++++++
 drivers/gpu/nova-core/gpu.rs             |   8 +++
 drivers/gpu/nova-core/nova_core.rs       |   1 +
 drivers/gpu/nova-core/timer.rs           |  40 ++++++++++++
 drivers/gpu/nova-core/timer/hal.rs       |  39 ++++++++++++
 drivers/gpu/nova-core/timer/hal/gh100.rs |  71 +++++++++++++++++++++
 drivers/gpu/nova-core/timer/hal/tu102.rs |  49 +++++++++++++++
 drivers/gpu/nova-core/timer/regs.rs      | 103 +++++++++++++++++++++++++++++++
 rust/kernel/time.rs                      |   3 +-
 12 files changed, 368 insertions(+), 5 deletions(-)
---
base-commit: 7a6bc132f1b51437063c9203e7221067b40a791e
change-id: 20261102-nova-timer-f4b9de3274a1

Best regards,
-- 
Dave Airlie <airlied@redhat.com>


