Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792983420;
	b=4R1wBBPkRI9Ocz5lTggUTOg0FBkzI2qQFpPbuVr+umJPtZ16UzI6xACMc4rEwgmKMUTx
	 MKH5zkaMjU0Y4wWwduYHpRcg4IKKR/N7qZxmjUYUlwkOT8Wf5Gc1Kw/sLIcboswPyXDFQ
	 lfC5NS3hoOIqhx4C58+ELVUjrna+kyc/QDdabe2A0n8Y8/0p+7ZndgKzAQIdAWmAx76hS
	 I2ZYULb+8nFo5VFqdslHpRVq9vaB38nTOii29CR5GRQMa2cW8FBFEif1/B1ALHWgqAYfU
	 WZY+tdzRjQpRsW9b/YF/qsrSXzI0nOqawXYA9XqULqkyKJssc4tkvpQkCZLThptSo8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792983420;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=4EnjKd3VJElwYYKPc1UJ+fgB3qHQGsHVfDHnlbOdIR0=;
	b=kMn1lHurDnyoFTXu51cX2AKya9hf2beiDVFoPCFSI/8N69XGPXLuTrzKn1gROCYG9uiZ
	 ftWLBqYC7RhaD+ksBzWwxbtQPlx0T7oA/ktGTOUPEuUqFRLDBmgmFLDKi2idhQyqq1y3W
	 7M645tEN9YkbyCqyb9iL6h3rB7VSlu/X2dzJW0arZUA+f0Ug2rvDHNa1MqbHPMN9x9uIk
	 8hLrlls4wxgWcM6hPVr6LawwrrAw0KvvfBjwb5bECys4efI1xFBsyCEwDhum1GP9UFyxL
	 c4HK6v2vM+zjYdQVW8BnMonalxsKDcfIDW6oxnUDlyWbur8WS04WRbuTCSutfG8Uzow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPq7zIGb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3993A606A31B;
	Mon, 26 Oct 2026 02:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPq7zIGb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792983420;
	b=nAJiA1ubu2HYYUxu/oD+tUDES/nk/X2ICi7ForMYFK0P8+yJpWPc9+2CJeilslWB1mnm
	 lDMi1fQXf56fMErkR3blPoH/oArmxCkJYtY4bpia9kKee2vaF7gdL9/0K6B9MDEbUbLJq
	 5qGK9+rmSYc0JgO3hPP0ubGIkCRTeW41VwXHMEwW732yiMlS8F+gw7SHFX4FvhtH7D1qx
	 fmmQY6lU8SYMSasxdigC1JSoz/EfiUWwG+XUKLimgO7ZUYEJrEZ6CwVnycOC86MN9CLZH
	 wRhQ5TbpGTCWePGTumZt6GAhLS9Z3Ar9afkg5ll/4/qhkDQFNU0QFIWpf/f5Gk961ow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792983420;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=4EnjKd3VJElwYYKPc1UJ+fgB3qHQGsHVfDHnlbOdIR0=;
	b=iwrbNfShNPS4PU4XHmPQTO8b7sC9Qs5gSkBrhCQa8S8EFWb7mh2Px9kWRqF7hQwijj/O
	 anO0ZxuW5E3lGWoRqTUB6v9lWR7Nh3mojHU3rNvaEJ4wopiXplj3r3Yc+WgKZ+CsDLrDV
	 FKYHR9WRRJkUbBdqd7U3CC0wvOFJDD/4M91jO+9ORbQJGKPlwme/tLr2Ll7AdIGehNdO7
	 TanQn+9syeC29kBevQtc1KzkqYLaekNj8Tnx6WsId47E1Fu2RGscF8zTf/BKQVqe8XOFi
	 51vd9u6GuDQ9UYi7YsiqIDOulkx8+zMy/CkFhFXktmixFH07iN0WcLIbRlzvmEmlMHw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B7F11F01825;
	Mon, 26 Oct 2026 02:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792983419;
	bh=4EnjKd3VJElwYYKPc1UJ+fgB3qHQGsHVfDHnlbOdIR0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=hPq7zIGbbcKDqbmEmNPte6tfGFM0al+aaa2BAzKBVURtgB9mST/gugXLbVslzOvro
	 o2fQ/x6hDdn3343vckx+Oo2HrpwYA0udV6pcqrRnRkrLplo4jWdEongfSaDnSpgUK+
	 AKJBQcOafoSbCJBidCFb9MJOPxlNma5fz2k+hLAfgtbPCoH7uENPCWzQhto4XLQK1i
	 IPN3I94QLM7r9QQ4NqE4TAQVFGgIxwIh5MlPSZB5hvamo/k06wP1RtdhU9aZXVsdlO
	 lTQ/chJ2hPC6yLyi9AnSHT3Muyi8Mx5kYtdUuGa80rBQ8hHaygRbcmycaHGhkKdM8w
	 w3SM/hBcy6xnA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 95D1144BCD;
	Mon, 26 Oct 2026 02:56:58 +0000 (UTC)
From: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>
Subject: [PATCH 0/2] nova-core: add initial support for gpu timer
Date: Mon, 26 Oct 2026 12:56:47 +1000
Message-Id: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7bkElIvpKdAhdaw9ZrBWC+Pekw
 xzmMFMgkTAlmFQBoZcTn7GJ6RS4fY0bIfvmYLUdTAO9HChPujFSvtGPxpEOPTkfoDWXUOD8/+a
 l1g9MHKSyXwAAAA==
X-Change-ID: 20261026-drm-rust-next-d81ce0f4ecdf
To: Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Lyude Paul <lyude@redhat.com>, 
 Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=airlied@redhat.com;
 h=from:subject:message-id;
 bh=AWylCJ32K1PQVK694S3XIzNgSfSyKYezuYTSe8/2JZc=;
 b=owEBbQKS/ZANAwAKAQx081l5xIa+AcsmYgBq3sF5TvjdrYFXJqaTGnHQnKmCCgVOheitNaqBP
 AzzJerMwjaJAjMEAAEKAB0WIQQQptkdobBb0p9t66wMdPNZecSGvgUCat7BeQAKCRAMdPNZecSG
 vqWrD/47tGijWYutlf7++GxY1NwK2qakbkhgLW2ko9JQ6au7YmOEBSotDqv/NqR+U8HrfyHIZ+Q
 HkmzzUMUP5Ab+7ezICsUmphhWqhVAv1jJ9g6/iYkKOu9kWQeV5wykT7ilxHfSVMJg3aid9WwQaC
 mngnr/fY23WQBzDQzPZ264ylgZfPqforP2wnxgT1ijE97hoyhfo5h0qyiosOrKtEfP28FKEuuOu
 nCBB0JhwQEPhtJTpwyZFGbKHyhUfVertUxWgWXcWmRlGntsfakW1qS2qqPvMhxQsnLfHZUGcBVV
 wcUOTiTaTteMEz/Xyhs97A3kPZFiVyO4lm/gXHE9wxUcYigdHQ5H/BUJI5EcEY23trAae/UuhS8
 gh8rifmqbI88IMj0dKr2zWoOTdpwxQFkHGpxzBoEwHmz5IQuYr5Q7KfA738zDZPYfchkGr2W8RV
 sAz4VHXqN+HKvDsMWt0OkAf5BT45ffswRv1N6QR+nwpGz9xGSyETWpH9aFDBMG+VSkTR98oTygZ
 3o6tfAxHmegxfJvkTS2OcnrNz3f9VylJ/u6wZzgs37qWceB6U6l3W1b1OfzpLll7hZ4UsZNizv+
 j3W/bB0+m9FAqb43+qBYUmyHUXdUaKhGDYmpnlTOcAX71f0Rp8ZIZ9QbHrO6pld1q+nabpGhxVC
 3J+8Pvc7xVMOpUA==
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
    
Dave.

---
Dave Airlie (2):
      rust/timer: expose as_nanos for clock sources.
      gpu: nova-core: add support for GPU timer block.

 drivers/gpu/nova-core/gpu.rs             |  5 +++
 drivers/gpu/nova-core/nova_core.rs       |  1 +
 drivers/gpu/nova-core/regs.rs            | 40 +++++++++++++++++++++
 drivers/gpu/nova-core/timer.rs           | 37 +++++++++++++++++++
 drivers/gpu/nova-core/timer/hal.rs       | 32 +++++++++++++++++
 drivers/gpu/nova-core/timer/hal/gh100.rs | 61 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/timer/hal/tu102.rs | 55 ++++++++++++++++++++++++++++
 rust/kernel/time.rs                      |  3 +-
 8 files changed, 233 insertions(+), 1 deletion(-)
---
base-commit: 3497a403264b094ebd61b8b755165d56e7d9dc37
change-id: 20261026-drm-rust-next-d81ce0f4ecdf

Best regards,
-- 
Dave Airlie <airlied@redhat.com>


