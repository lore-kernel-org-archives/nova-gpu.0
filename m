Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36CC306776;
	Wed, 23 Sep 2026 00:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790124087; cv=none; b=ZmFlLO5dRbIg/j0xK2K19d1ELiBOp3FtylW3Bt4Jrlly2ty75c0QLn2ATFz+2PM+cy39h/GaNusPPyaq4PExz3ddEgpUaxVw79eqmRxPeQ+W4TnixbuIP87PpHxY7XCuFLW54K9gSoGPnHB52w5xW2QstgMaCd2OoOZfM/xjfSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790124087; c=relaxed/simple;
	bh=VCzKql25amCUZBufofXFm/DKpx3hT6Ob/bItNqYWLwo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TlCQIkFdoar1OusRV/zNUndW1HTFvy0gBVTG7DZFfQMTsNmAAUDQDhrH2o4o8qLj1ydXhavN3bHq+pSoDObZSwbS4Z/2bikVJh9cjta043pE4r4O1OKBl+cYpZsqW0OtWQ/0z+vLg7Xf1g5BEew92Ed9yvFeXZssy5PAqQvEI8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfyX7L0w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfyX7L0w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41DE5C2BCB8;
	Wed, 23 Sep 2026 00:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790124087;
	bh=VCzKql25amCUZBufofXFm/DKpx3hT6Ob/bItNqYWLwo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UfyX7L0w614zrSdsgpBpWK3ePWXcZrPmjDI6vPcT2hgjsge4dq/Vs/DUdPnE/CSV4
	 RoFAIsUk5t3o5VSXuBnzeKS248HtuXRHqVdnuDdJrXLY1zIBN6UxkUrLg96vfhhr2h
	 xgyULlRdW2b9whlWq7N79Wzvi0ce/r0EeSllTwWrDICHJ2dQ2YvCYU52vGL140pNHT
	 kLZ5WZYYRJL7P+MEopr39Y92jLZ/rsaNGW4vn2uR49tvkS4+RYuZpNVWEfnqvJujOZ
	 uKD7aXZJskBCSVcBCNtupOPukocRbKp+zP+bGktiPAXg1tkUFzbyzH+EY1rS0CNX5W
	 fjbH9687H8Yjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0EAC98302;
	Wed, 23 Sep 2026 00:41:27 +0000 (UTC)
From: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>
Subject: [PATCH v2 0/4] gpu: nova-core: Extract falcon registers
Date: Wed, 23 Sep 2026 02:41:06 +0200
Message-Id: <20260923-b4-extract-pfsp-registers-to-falcon-mod-v2-0-74600fc068c4@nanonej.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6DIBQFr2JY9zcI1GhXvUfjAvCjmBYMUGNjv
 HvRpvsuJ3mZeSuJGCxGci1WEnC20XqXgZ0KogfpegTbZSaMsorWTIASgEsKUieYTJwgYG9jwhA
 heTDyob2Dp++gQcU41wIVRZJtU0Bjl6N0b78cX2pEnXb9vhiyx4f3cWUu992vWv1dnUugwGt+K
 TtDG1qLm5POOxzP2j9Ju23bB2z6mnvyAAAA
X-Change-ID: 20260824-b4-extract-pfsp-registers-to-falcon-mod-9eb233c4eb0e
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Antonin Malzieu Ridolfi <dev@nanonej.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2723; i=dev@nanonej.com;
 h=from:subject:message-id;
 bh=VCzKql25amCUZBufofXFm/DKpx3hT6Ob/bItNqYWLwo=;
 b=owEBbQKS/ZANAwAKAWaH8SMKFRX9AcsmYgBqsyAs1fcZ7p1DTWHT0SKvVscHNOQrK4AFAZ/WF
 7mT947b3JCJAjMEAAEKAB0WIQSDtk+wfJEhL1KFIn1mh/EjChUV/QUCarMgLAAKCRBmh/EjChUV
 /V4UEACAS9pezoPlyaM61UFlAnWZCEqoxEwGAYqeXtVkqGu7dd1YX19joe7zVhzVd6qVPB0ot4t
 S1Q7V6gqXAYNJkPdHBDSrFrXdl1eaipthEZNO5QTY1eROauRjbo5k3/SqpyErNu2hikZ/FNqY0D
 SB7U11g4OCJQQs04O3HVDvxSFQM8q05jjxz/xSG+f/rNsi4gj4trYj/pQ6UHJjB5/cc8bBLrkg5
 Luco+IsUGqu3/oCSnrK5wR2RxUiSpbhAsnX4mjz/Iuyh0DWpVVypY76Jpjh9sByjA6B0VJgZVcr
 MloBOHwvMco37OFUqW8c0+0ERA1wDBpQulRB5f8Z21Ha7i8D4r5gzoWpa9NBshCRkkSJ3LSWCQe
 GimaY98n3Fx/3jXgI2QmjHjtwMSTru3/hv2bXt4M2LnzjUFiFi2B8Mhg0jBYhYsxGhtJ2y858f4
 GA0Nfmf93S0gNYNHWEdWTdmZg+K4OHRkQ1vMWkzESKySL0TaYcI4NHMtKpIRmHrA3a6rYwP6SaX
 8ytoPUfBq9SJ0waUwm/nnOKLdPq+be/WWIxXgWunqmw1vTJ23QL1fER2ZvbkRoRHNE4dgEK9uEv
 Jl3NQ/pQknM5wLrG6Z/hVWmcx7jh3/DcEeEzVKfYhbFHH/Y7JKkF/sU5HZLZP5czvpOJW5UYrlp
 pprS0JPZr4sP0xg==
X-Developer-Key: i=dev@nanonej.com; a=openpgp;
 fpr=83B64FB07C91212F5285227D6687F1230A1515FD
X-Endpoint-Received: by B4 Relay for dev@nanonej.com/default with
 auth_id=825
X-Original-From: Antonin Malzieu Ridolfi <dev@nanonej.com>
Reply-To: dev@nanonej.com

Move PFSP, PRISCV, PFALCON2, PFALCON registers definitions from the
root regs.rs file into the falcon module.

I tried a different solution than rescoping all  registers with
`crate::super::...` by re-exporting them, hence the comment, but I'm
not sure it's the best solution. I was hoping they would all disapear
by the end of my patch series but as we discussed FUSE register
definitions better stay in the root regs for now.

Also the extract of `set_fbif_transcfg_regs_at()` change some
other functions signature, I think I have covered all but tell me in
case.
And I wasn't sure btw if `.try_at()` required `#[inline()]` there.

Finaly, If I'm correct, this series should conclude the refacto as the
remaining registers seems to be better left in the root regs.rs.

Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>
---
Changes in v2:
- Rebased on the current drm-rust-next.
- Confined the FBIF translation helper to the GSP engine, as suggested
by Alexandre Courbot: it now lives in falcon/gsp.rs and is implemented
only for Falcon<Gsp>.
- Renamed that helper to set_fbif_transcfg(), as the registers part
was an abstraction detail.
- set_fbif_transcfg() takes now ctx_dma as a usize, and also FalconFbifTarget and FalconFbifMemType as additionnal arguments.
- Removed method extract from falcon.rs as we cannot call a
Falcon<Gsp>-only method.
- Made the pfalcon field of Falcon private, now that the bootloader
goes through set_fbif_transcfg() and nothing outside the falcon module
accesses the PFALCON registers.
- Link to v1: https://patch.msgid.link/20260826-b4-extract-pfsp-registers-to-falcon-mod-v1-0-38351df09084@nanonej.com

---
Antonin Malzieu Ridolfi (4):
      gpu: nova-core: Extract PFSP register definitions
      gpu: nova-core: falcon: Extract PRISCV register
      gpu: nova-core: falcon: Extract PFALCON2 register
      gpu: nova-core: Extract PFALCON register

 drivers/gpu/nova-core/falcon.rs                    |  21 +-
 drivers/gpu/nova-core/falcon/fsp.rs                |   6 +-
 drivers/gpu/nova-core/falcon/gsp.rs                |  23 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs          |   2 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs          |  12 +-
 drivers/gpu/nova-core/falcon/regs.rs               | 311 +++++++++++++++++++++
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |  18 +-
 drivers/gpu/nova-core/regs.rs                      | 298 +-------------------
 8 files changed, 357 insertions(+), 334 deletions(-)
---
base-commit: 6bd5eaeb9827ca7ba953b68fb27948fdb3e40630
change-id: 20260824-b4-extract-pfsp-registers-to-falcon-mod-9eb233c4eb0e

Best regards,
--  
Antonin Malzieu Ridolfi <dev@nanonej.com>


