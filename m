Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6584648CD71;
	Tue, 25 Aug 2026 23:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787701498; cv=none; b=caB2RNooZEH36EwUAcCoYv7I2RiDGuJRiBQ56mFYR2O8IPBvOkAIOkZySICv4hK+P8zPVpRsibgnDRMefMjYb+q7zX6KKtrCf3EWz/V/ScizGsRVChLAiOJDNfxKMuqp+6bKfiHP5eei4dHdlefwR8BFa7qfSKphwujWWQfvWGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787701498; c=relaxed/simple;
	bh=yahlqdnVKdlnxPv7kgdCgJdOJCjTzFaRNEl+vby53Eo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L6LVF14i0tAWcgCIKqJdHZ8UJ8yTQAt5uEZy8MX4BdDz2R2Ir1UWnhenWHlVKkinjn6yQDP/ctcNghCk71rBgh7xFu37JY7qmgBV1gCBDU/opoCStjhLTQ2qWNKryEQam9piGB3IU1FdkUvANLSEfx+QzDXjQdhOQpmk4vgAn0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcwCQ5c8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcwCQ5c8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF086C2BCB8;
	Tue, 25 Aug 2026 23:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787701498;
	bh=yahlqdnVKdlnxPv7kgdCgJdOJCjTzFaRNEl+vby53Eo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NcwCQ5c8UxpB4cb/xG0fyOp/MX1wadAx+YQDMOppxoCbLdlpqD754sv4JAE5R4tsg
	 9ghKu+swuEsARr5As/BLmdEkOI4UxBlWcEZVOjymIOFhVX7gvxDdqGURBEbozQwjMn
	 zpXXYxa2WQPfpd2UD9lWnfA7EEc2aTX0a0QnUBW8NhWSXIE2A9Oe7xOzleACiInnpL
	 nDRIUSbJHwztUiIISXmTv94kU7bTOxTfTBUPjHi2HYW9SRhPwkWtmEKWar6yAtuXK+
	 N0F4w0C20eYAK68+EuwDffXbqN9VIZ1kofgRaTuCZJPTH+jemkU10zcQt1FUkpQVSP
	 yXaCa4jXeQuuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49FFC61DC4;
	Tue, 25 Aug 2026 23:44:57 +0000 (UTC)
From: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>
Subject: [PATCH 0/4] gpu: nova-core: Extract falcon registers
Date: Wed, 26 Aug 2026 01:44:17 +0200
Message-Id: <20260826-b4-extract-pfsp-registers-to-falcon-mod-v1-0-38351df09084@nanonej.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBBA0auUWTsQ0yDqVcRFkk7qiCZhJkqh9
 O5GXb7N/ysoCZPCeVhB6M3KJXfsdwPEm88zIU/dYI09mKN1GBzS0sTHhjVpRaGZtZEotoLJP2L
 J+CwTnijYcYyOgiHotSqUePmdLte/9RXuFNs3D9v2AQPfdjqLAAAA
X-Change-ID: 20260824-b4-extract-pfsp-registers-to-falcon-mod-9eb233c4eb0e
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Antonin Malzieu Ridolfi <dev@nanonej.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951; i=dev@nanonej.com;
 h=from:subject:message-id;
 bh=yahlqdnVKdlnxPv7kgdCgJdOJCjTzFaRNEl+vby53Eo=;
 b=owEBbQKS/ZANAwAKAWaH8SMKFRX9AcsmYgBqjijxzESK/eGaMHr+EPAPyhvYawjQyQmfITTVS
 zajJ4lOX7OJAjMEAAEKAB0WIQSDtk+wfJEhL1KFIn1mh/EjChUV/QUCao4o8QAKCRBmh/EjChUV
 /UuXEACoo67K7QxxNIrys3YxVZ8cj7nYt/S+aPbV+AWLvJ/7LFEckl98v6FIOVMwGVnwOT+or7R
 T3K8W9K+QFQr5a7FkWu5aorbO33T3UEO1wUaigdm4s2MZnIq/SWMb9N8rAzGaBNUGeDIZ1VGCM0
 SWTqZDMVKNunkErE1EHezeIIqZuxzJU7sLS7LBNYwQ4xWGZ29ibl32HAfO46JFZth5eHUdVpnma
 7/DVYcIBfg7fncPUBWZ+SlZFZoc3B/ITjY8fhKLq3d+W9QyzaxVisxdry1NNNc9eKrR1aeIcy8r
 Vog5YMLI3kHWBX7ZPEqPPm8pzBHFUIr959bW5nzNeVvfA+gQvAOT5+M1uLzneJRrQNJAC9u3FRI
 T++Idtv9CnjDenDGKTJ8tT/laBvTgV8yi1CC+09drc/tNtlsBqrprHaAuNrnw1ErgLIqJqyQ/Gq
 CYYk3HLKKhnW+03VSMfiprvAl8+RSJ+ow//FcrMv42ZLaWpWnvaXQaW6xQjF38FaEGZqaXkmohM
 AAVahj9Fde3NngKLoUxVHVDV6gwLLcByc3PsgLTXagAXrLAqwcrYWP57DY5S2EAckUsINztOzR+
 iHq+ELKfeS0yEMSpiccrtGq+maxo4X8nY0W3awc4C5dox9GhbpJvw7zc2k7RfkPsBfXz7b9G5JD
 n0Ftg577Mw28Jww==
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
Antonin Malzieu Ridolfi (4):
      gpu: nova-core: Extract PFSP register definitions
      gpu: nova-core: falcon: Extract PRISCV register
      gpu: nova-core: falcon: Extract PFALCON2 register
      gpu: nova-core: Extract PFALCON register

 drivers/gpu/nova-core/falcon.rs                    |  38 ++-
 drivers/gpu/nova-core/falcon/fsp.rs                |   6 +-
 drivers/gpu/nova-core/falcon/gsp.rs                |  16 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs          |   4 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs          |  12 +-
 drivers/gpu/nova-core/falcon/regs.rs               | 304 +++++++++++++++++++++
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |  22 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs             |   7 +-
 drivers/gpu/nova-core/regs.rs                      | 295 +-------------------
 9 files changed, 352 insertions(+), 352 deletions(-)
---
base-commit: d53bc149eea6213e9c4a4604df5521db7b7296ca
change-id: 20260824-b4-extract-pfsp-registers-to-falcon-mod-9eb233c4eb0e

Best regards,
--  
Antonin Malzieu Ridolfi <dev@nanonej.com>


