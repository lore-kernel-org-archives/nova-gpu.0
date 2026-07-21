Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357AA46AA93;
	Tue, 21 Jul 2026 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648497; cv=none; b=c6x3CHsu9ADA+akbZIC2UMC/C6fykTeMhU5t+Zhv46aQ405k2rLPI+qp5H3zKVvXvL4Kp1julVgflLcPiz+gFbHsawD/ExaB+lYe6Qgq1VtkAoGcSMGQeoJ09d8GBtcMlvYVfDxVOhk7VzHcgMwWf4iIIsU9W8eTqhEg98oVVr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648497; c=relaxed/simple;
	bh=ZbffgWN1kX4ZHQUBKZKA6y26aw/ky0IhdmuCiZYJ8QM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zx26eYLvfgUqdkHxJfe/zMo9BI9rfkHSLh1VMwjSEmBp7ODppjlpC5A2fMu27j6K0jhCO4eqaBmI0+O/8FT/ly6AaJY7FgKEPd82vD4BEcGD+rLzIwJsIknUBEV1GDjLCia/HjQIiBXMVVR94B/wQQ4s0L9dvvIrqpQBcam5v9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdGOkI5C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdGOkI5C"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5673C2BCB8;
	Tue, 21 Jul 2026 15:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784648496;
	bh=ZbffgWN1kX4ZHQUBKZKA6y26aw/ky0IhdmuCiZYJ8QM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cdGOkI5CpOhXcefJMLZrETlDrwZVfSx+KJ00/iv6Cyq7xRIZ3SoSK7GKkXwnTbtpm
	 FgHyzifUpnSYeU3ejWHoCY/SsdQEG4EGUghmeOisHuw1aW+5khagvg9SzW3xxGsK32
	 4F30KJkdl5Y1tufTOBq7K4EI1XHLpZPa4FhYSyvLYmQAl0YvR3uFi3UbjLXhiw97D8
	 970caAqvMCvZ9OVP1nzsY1EnN90RUJWHq0U3WtLvxscNQXcEQdkHklzf8EHGvHjB8D
	 L6kOI70UX/twPMUWBmLdlmx3uzP3WBGbX3vmSaGu3Yj22GtPdOAAnYMG4WGMJ4shHK
	 f7uMi1Ia2y8Gg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B182CC4451C;
	Tue, 21 Jul 2026 15:41:36 +0000 (UTC)
From: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>
Subject: [PATCH 0/3] gpu: nova-core: Move PFB and PBUS register
Date: Tue, 21 Jul 2026 17:41:06 +0200
Message-Id: <20260721-nova-core-regs-split-v1-0-384fa2a42244@nanonej.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDtgEvyhVyldpMlUR0oiMyoF8
 e6mdvkt3ttBSZgU7tUOQhsr51RgbhWE0aeBkGMx2Nq2dWcNprx5DFkIhQZFnT+8YOyc6503TUM
 RSjoLvfl7bR/Pv3V9TRSW3wuO4wRNFyhxeAAAAA==
X-Change-ID: 20260721-nova-core-regs-split-d73383a155ed
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, daniel.almeida@collabora.com, 
 Antonin Malzieu Ridolfi <dev@nanonej.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687; i=dev@nanonej.com;
 h=from:subject:message-id;
 bh=ZbffgWN1kX4ZHQUBKZKA6y26aw/ky0IhdmuCiZYJ8QM=;
 b=owEBbQKS/ZANAwAKAWaH8SMKFRX9AcsmYgBqX5MlfFPdj9d0agONH2SWdbsnkVH1uxCaAHG3f
 M7NMGRyDSqJAjMEAAEKAB0WIQSDtk+wfJEhL1KFIn1mh/EjChUV/QUCal+TJQAKCRBmh/EjChUV
 /W4tD/9ilWfV5dVSZo2RhjUS5eMld167E+NfAUtKbS58ckvT0Nt3deTt+J/4CKyu2k0qwMfaTqK
 cghdIy6FF1chdc7819EMkuUAXQ4bYZWUO5/4qZTjURGFedlmCnN5+EveL6Kmc/m9oRIX+NmzfqS
 7/CDKrJ2J9pnpl85fBXsSGyxEscTOAUUjKOZufiFjKoAUAS1X8rSJ5Dfh5NSoP0soPH6afmCzMn
 fm3RtuFocHxvbWih3ijYwyD45v7G0656Q74KEblqKaWMaKa5wiygN4p8qVYwGN+NPOZscPJCsoV
 RLGaO6EbRnpYpHdd1eqwsIIE7JkWAYcVPj3kb1MCzXiLN8zNk/O5tmbxymFrPQxsU+sLYAWBVzt
 Anj1zl6ApdA992onra62vBlTyX3cYRjc7aa29UJvRCx+84VdF5Bgu66dKHpi01XosyfI43OEeL7
 4EIaaJ7RT5bYAJjXrA1Qlr8Me/LSeruNbUJcchprKtzYhQ0YZIxHlOOXm70sQ1c80pO7AFfAX8a
 bs/3JshNPieWjcu+fwJUiEmrS59brKdlzHDb8T55kKgs5Dw+qRLn0+O6rN4BmpwfCEvhSfBBhOs
 OhHpkL63K+E2Gu/8qk8ZbCOkHVT7HFmait6HfKScdgHwEwNKL2MrKXUq2ekH4sXsHDcDNyejPn4
 sODTXl4jXEi6gTw==
X-Developer-Key: i=dev@nanonej.com; a=openpgp;
 fpr=83B64FB07C91212F5285227D6687F1230A1515FD
X-Endpoint-Received: by B4 Relay for dev@nanonej.com/default with
 auth_id=825
X-Original-From: Antonin Malzieu Ridolfi <dev@nanonej.com>
Reply-To: dev@nanonej.com

Split part of the registers definitions grouped in nova root register file to
belonging modules whom actually use them.
Add WPR2 range query function to fb module.

To: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: nova-gpu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: daniel.almeida@collabora.com

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>
---
Antonin Malzieu Ridolfi (3):
      gpu: nova-core: Add function to query WPR2 range
      gpu: nova-core: Move PFB registers definitions
      gpu: nova-core: Move one PBUS register definition

 drivers/gpu/nova-core/fb.rs            |  15 ++++
 drivers/gpu/nova-core/fb/hal/ga100.rs  |   8 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs  |   6 +-
 drivers/gpu/nova-core/fb/hal/gb202.rs  |   6 +-
 drivers/gpu/nova-core/fb/hal/gh100.rs  |   6 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs  |   8 +-
 drivers/gpu/nova-core/fb/regs.rs       | 132 ++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/hal/tu102.rs |  60 +++++++--------
 drivers/gpu/nova-core/gsp/regs.rs      |  11 +++
 drivers/gpu/nova-core/regs.rs          | 132 ---------------------------------
 10 files changed, 206 insertions(+), 178 deletions(-)
---
base-commit: 22e77d81d0a9ab3aee1c5538b3f2f8a66930bfa7
change-id: 20260721-nova-core-regs-split-d73383a155ed

Best regards,
--  
Antonin Malzieu Ridolfi <dev@nanonej.com>


