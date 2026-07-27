Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3C0380FF2;
	Mon, 27 Jul 2026 15:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167514; cv=none; b=oqIpo/NWdSqjQZUPaJRzklAy+p7qnW7GF42vpYyv9hOJPnPcJ/ecVToQO5t7DqXoaA/cuWSS/P/hrIRY9Y3MAIIKD+yuM9WnpFgtTDpFoxoWx+zLvREVnC1IBlvkchZigvkUxbu2JeEBOJ8Mngnye9ETzgtjAHXBVUA+eLhZFac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167514; c=relaxed/simple;
	bh=XnAq5QeK6zIJiazPwKAtAy73Gab7jM6F+MrIWRRwkC8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ACnoPQgLl87AVfL+P2ClGDyCQ4+i34zuK5oy+wyuY2+XJO0cItga41AQTGmRo78RKs1LEJCElxx3I+ouiE12qNIPDYRnAxc88Frybgt8W3HSFwBxKpYDBAPgDREQLu2lk1mNKPH5oKM7jptMd9NC1txTt8EyDguYwsFuKZ/5nEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rllQb7dl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rllQb7dl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1318C2BCF6;
	Mon, 27 Jul 2026 15:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785167513;
	bh=XnAq5QeK6zIJiazPwKAtAy73Gab7jM6F+MrIWRRwkC8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rllQb7dl/yyzC2oVbQ0bOOU/IX5N8U3Cgq7ekB2ZNCWN8QhBsHCPjW9HuRAXe+Ye2
	 DLAAjYx3uwEXhoraxJfownnlFST09Fgl+qu/mbPzFeTi9eeoXEJRjv+aGed8ZN3XTU
	 XcN4MoM6zpJjg07P6gbZW/WNpYpWfRtORj8weVYlrSW7lyOmGgsUxhp4SwODMGx0Tb
	 Ogk8oHKCyN2YzkBNf6BkNJVEdg1uJrvA6V04k73AUMBTSL0RQQFsOfhML2kqNZAhwc
	 2BGunsVmBq/rFCQo4S0jEjfjqzP9lZ9b/dYz9JTMG9iVotGoa8upM7ZxYWywb5oiVz
	 9iI0fd68IbZNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD34FC531C9;
	Mon, 27 Jul 2026 15:51:53 +0000 (UTC)
From: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>
Subject: [PATCH v2 0/3] gpu: nova-core: Move PFB and PBUS register
Date: Mon, 27 Jul 2026 17:51:50 +0200
Message-Id: <20260727-nova-core-regs-split-v2-0-21b5e6e32ea5@nanonej.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTvQJtSKVxEXMfmtI5KUmbYIp
 Xc36vJbvLeRQQVG52YjxSomJVe4Q0PxEfIIllRNrnXHdnAd57IGjkXBitHYppfMnAbvTz50fY9
 ENZ0Ud3n/tpfr37bcnojz90X7/gFKh1LLeAAAAA==
X-Change-ID: 20260721-nova-core-regs-split-d73383a155ed
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, daniel.almeida@collabora.com, 
 Antonin Malzieu Ridolfi <dev@nanonej.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686; i=dev@nanonej.com;
 h=from:subject:message-id;
 bh=XnAq5QeK6zIJiazPwKAtAy73Gab7jM6F+MrIWRRwkC8=;
 b=owEBbQKS/ZANAwAKAWaH8SMKFRX9AcsmYgBqZ36YAcsEqTnVG6xnAMibZxcqJhuuMeD8QllvW
 b5ro1dvOvCJAjMEAAEKAB0WIQSDtk+wfJEhL1KFIn1mh/EjChUV/QUCamd+mAAKCRBmh/EjChUV
 /UAaD/90AAHMJHa+FgHnCldsVTgm9qSxevFs+4D4RdvqNRZgayHjAtPc1gMGddQrmGKWQaQYhC4
 LZK7JDRzGZWpEqEhBWZXhhGX8m8Ezp2G1q8ixlrqS5OKZ63/shseLhz8EfWf7OiqLa7uNkjZuJn
 rPRRX7nvdNG+z99E8nnQFKvxKwe05adBw2ubogo6KxQE/QiOL9UXQvGHMhucl1UQ5L9gzkoho4A
 VU5bhRmTPuqZIppZWAOJi+kA4wtBdtQq3TcjdguXNX/CF67oWpSk/h5HhYXd3q2kjnb/chc9uyQ
 6yzMVLVVw7I9N8PIpjhQShZzfQwgiaXQVFAMOuz+6SiTNY1ANT0lp9NCqpbAcavmbY0E8dhediK
 HNv58xJsusDK2kAWpOa9QGHk1mgLJfTWDGvWeP/J3GMfEZNsAMm+M1FOz0Ev49lHasbNWc10tna
 uObrxgNTnFKJkXYsHmqDmVeG96Tye6DkF14OwMgAkH0SwK3+c+zafOOkH1IPpxLjYIegTu8A/Vc
 GwWeSxBwsK8Lpw7DOOcYkqt27eCgvscu1VLeE4ZmIVfHr/3PIKQ9b/To85us+k33OhGssvURkS9
 azH35kvpDzK2gIJR1vQ+Lc1giTzwPLQEaWxr0eows4P8XryHKntag4V2P1nK3uPfxh02eJsLOf6
 veFWeQhCnAaXAvw==
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

 drivers/gpu/nova-core/fb.rs            |  14 ++++
 drivers/gpu/nova-core/fb/hal/ga100.rs  |   8 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs  |   6 +-
 drivers/gpu/nova-core/fb/hal/gb202.rs  |   6 +-
 drivers/gpu/nova-core/fb/hal/gh100.rs  |   6 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs  |   8 +-
 drivers/gpu/nova-core/fb/regs.rs       | 132 ++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/hal/tu102.rs |  56 +++++++-------
 drivers/gpu/nova-core/gsp/regs.rs      |  11 +++
 drivers/gpu/nova-core/regs.rs          | 132 ---------------------------------
 10 files changed, 203 insertions(+), 176 deletions(-)
---
base-commit: 6dcbb4b1320fa91fee349462a52bb69135f2e45e
change-id: 20260721-nova-core-regs-split-d73383a155ed

Best regards,
--  
Antonin Malzieu Ridolfi <dev@nanonej.com>


