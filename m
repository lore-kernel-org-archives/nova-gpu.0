Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1B03385B9;
	Wed, 23 Sep 2026 01:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125782; cv=none; b=YH6kVH5hTymYoBz/sjjVZj4+uDanzIsCgsB2G5Mu+a5PJTeBn99edJRl2ZrYUxfVR+9/N+suLsqM12cACiMaSkP5hgVqm4fl8fGaj4sRWaS6z7gzct24wBwHsNgjrOKqZosqnjLsqKbS7LPTiLNR2WyC0r9cqcw/+JTYJkosAn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125782; c=relaxed/simple;
	bh=51WgwLj74wY5i3rm4gNiSdQcU+nhQfDG69JqTHOxSwg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cjxgh/ca6QByg6O2w07ETEeIwmLd5Slz76yNtP9ouLS6NfQ62mSPF53CezZxu0PSEM7kJF1L6XiJZf5rBdizNGEDV/3aLiJLlAZHPhI6e3O/739Ua/xPX/dZTMoiY5k4XpUVYGTkEPu0uE6xVM6ViQvenvOTEPo9xLQON0xsiQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xo5Vn1K0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xo5Vn1K0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE2A6C2BCF6;
	Wed, 23 Sep 2026 01:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790125781;
	bh=51WgwLj74wY5i3rm4gNiSdQcU+nhQfDG69JqTHOxSwg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Xo5Vn1K0y59neqTwErk8tFkRNHSuwCvTK/XfsubX+QJpDdkm7fnL2K056/JACX8CW
	 A/F/lN69ZwjvOrAugsNpeauB/KAGwBok0k3lT0/WOnK5KicGqgeZlpJadJZ67lTBRh
	 5BK28nBYJziIlJbz2ZoiVUvprtzbGc5ulK5RT5HZD8GEBWVP6KYXw2BFXolm5m9cuj
	 1Euo/m7n2jnHlxRaxumn8+0cVd9Vr1hXkI17f3T3eKKURBQTAcL3i5K7EEZJ9DTEUG
	 nCmt1Usbxmwtv/XxCGSLpo5jt2KsuuWCib+aQGTIqlN92JUYaaXirYiVBuG3RVqZWi
	 TTJvANF23gFrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A5DC982FA;
	Wed, 23 Sep 2026 01:09:41 +0000 (UTC)
From: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>
Subject: [PATCH v3 0/4] gpu: nova-core: Extract falcon registers
Date: Wed, 23 Sep 2026 03:09:24 +0200
Message-Id: <20260923-b4-extract-pfsp-registers-to-falcon-mod-v3-0-cd26aa94c021@nanonej.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OQQ6CMBCF4auQrh0ztBXBlfcwLqBMpURa0laCM
 dzdojEmrly+ZPL982CBvKHADtmDeZpMMM6mITYZU11tLwSmTZtx5AWWXEIjgeboaxVh1GEETxc
 TIvkA0YGur8pZGFwLFTVcCCWpQWJJGz1pM79Kp/N7h1vTk4orv150yXH+/nplyte7T7X4uzrlg
 CBKsctbjRWW8mhr6yz1W+UGtnYn/pUrLv6XeZL3skDUCotS/cjLsjwBzvv170wBAAA=
X-Change-ID: 20260824-b4-extract-pfsp-registers-to-falcon-mod-9eb233c4eb0e
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Antonin Malzieu Ridolfi <dev@nanonej.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3002; i=dev@nanonej.com;
 h=from:subject:message-id;
 bh=51WgwLj74wY5i3rm4gNiSdQcU+nhQfDG69JqTHOxSwg=;
 b=owEBbQKS/ZANAwAKAWaH8SMKFRX9AcsmYgBqsybMAv/J5JB9UJPWpglr6nhbC+kNU8nLtAXQV
 fcnWaiyci+JAjMEAAEKAB0WIQSDtk+wfJEhL1KFIn1mh/EjChUV/QUCarMmzAAKCRBmh/EjChUV
 /e9pD/9F0V9rPlIg615/LAShELv9wuexAnWETI/7+EcmK7/pFaM2foVRR1pr1gtNkL8PNTuDgQA
 J91Yy+aOO5EO4iVbzeOBUPl2/WDv/yYAgWejbU3Zg8AgTmG+wosvE9W41m4KnemaT+jG4ojKH8I
 rnchhoON4TcmSzXmPjo2drJcsN6ayRtGRVLzWkkqsVO8LTUQb+3QZadXhDIuBZAXv+vg0zkLHqN
 SuIkbtK5X9T5J0kur3pQC9rjQ0rYmAZgr6W28Xlyvt7AKmAvui/CQS2tK0W993f7ZwzX7E8nQkM
 9FvTpqEu1fMp7kaCUC4yZrrRZfWMNs51B4tek1ew7G63PW6jO+zRd+NrDw+ULKoEkyu97h7Wrhz
 qSS35Y6lG74iOXC+KObdONB5MgHYHAzuBZMqQFnw5DcoUxwUhMT/yALfx6XkX/RM4qBwY23asAM
 GEqYf/5wNfT0uYtv30UQXO10ZRJYl/ReSHxZJeJ8vH/zZqjXbtpv5qzZD2jL/WnE29yPXNVbb6l
 j796QF+Ile1JKlzQh5V2QFGI9ogGYrEOriwwlOVVtBji/SbH1WsFuUDb8kBeIOf6hHTmBZrwVqs
 dahE5BREq2YswQJLzq5Nmrv/3Q8KxjbEeOArvbAA3ygd+Xre9D4AOqjrcJ5E2l8f0hM5eIEzcWl
 4tDHkErQRzknFUA==
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
Changes in v3:
- Correct sentence fragment in commit message
- Fix error appeared after rebase: PFSP registers visibility was
switched back to pub(crate)
- Link to v2: https://patch.msgid.link/20260923-b4-extract-pfsp-registers-to-falcon-mod-v2-0-74600fc068c4@nanonej.com

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


