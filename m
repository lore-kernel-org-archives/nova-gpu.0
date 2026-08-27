Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012067.outbound.protection.outlook.com [52.101.43.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F7D37BE9E
	for <nova-gpu@lists.linux.dev>; Thu, 27 Aug 2026 07:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816807; cv=fail; b=q0SAqDxhOAwW99F3uZCtGhZPDFEh5DEs3Kajfaegrv7yVVcFqIuEB0MIiNmmutcTh4MzzZnCOZgtuKsjLNDtsRJptPK07PKmsrzAiJ3+ubaaTyviRapa1eYP7/W3vp9VdfqwaUmQJBEXjzP1pWEBIgyX9jvoq+VcUE00/SbeokY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816807; c=relaxed/simple;
	bh=2MNC2CuXaxVwh0myZLKVhomuP3DN9lyYmvCaPNfyhbU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qIZYU/7TVHwGVW8eRRQ7kd9ZW4pjL2WUZzzhtlmazKeIHaPoiJjQb9bc6NcYHMBU15+E+5ZW4TFkxHAiS/5fqV1j2yU/v/exw6whSPh5jZKqi2LK3/eskQMXuhewlSL6cjj8p19/KDRnwsadcgaw/DPHyW7nu6GSv68gBwI6uH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lBdtY9xb; arc=fail smtp.client-ip=52.101.43.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lBdtY9xb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oqyvua9uy1A8vCb1FrUwrJOg2nXwwz77aOxlN2cdjhvZ+aFk+ifIvf5PAdKCAcw7rZugxCtmcDBieJxQwJb0gKGN04+MuKCfJa2HnTYtjkwpN1XI8kA4e97r3JZaLs+fY6ly2R5pNmuln83Kvr1hJ7iiJmSC6zG0E08W3vYrWg5IH3Vbn/vkXTzG0fuMQHenV+JH9eR8YHJYKH7bodODOboprUPvXWdhPBX3uo22RZWYqDQn4j6IMTeWAmJcawohovXfnmS7nsi/h7m24x5DG3uR0lQbJUojV46D31EAt1tIViA84Jouj3OSIWr8k7Nzkm4kPUrX5hr7LjapAWxaAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y+I8GS3hmjwHzD1l5J1O5mDt3AMt7HbVpiMHiw8OmU=;
 b=FOTSIJjeZJ0Tk/IPTbUFBx0biy1BEkc0g5LUc7lPFbU/+HHRvCvBsBTqUwr2IroQvzFZPeJ4bposvLbrk0NRt+I9RGJIO6sENK9Vv7BCeNLvyroVizutRBx4b/Agv65Sa2ZsnmLIjw5xixPogohj0Y/04XRsFlkzvAY8kHPSuLdeMUbnsdZ3R+YQsgyeFI2iveqQy3p2DXua0pjM6wrA2R3LJi1kPzw+YZcTenHNNZxSOSbwPYlKSwuHrpPlm5oOK4QBQEAXxC8VwJRl480ByYamWJq679lLAtlPhVcz9izoaFujO85Nr6yoSryHxOPbU988SBClwua8DTm3GrYZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Y+I8GS3hmjwHzD1l5J1O5mDt3AMt7HbVpiMHiw8OmU=;
 b=lBdtY9xbmp/Lqskx+1ygWdaP5aLiNbWO5O9qqMzI85hkssIHh3z1L+R3JHioWr4Z09adY+IhSpAdbiLIPu4yfH0t9POi/n/ZaiwrGYhdPRLoWQxf/k3dZ/7EzI8T+yIetgByZtEuoAsg9DycgjNmakefNNgBN2DGm0RsNMyHDDs4iYfRB+QMczTj/8A7ABc76aSDl3q06i1balFrsb+JDVXs9DwPjV2JU3mMF+DgE87IsWTHFqoBKlJEJdbW3rBjYNEL0RpGbpxYQyGll9RItI2p8NUHX1hPIAMY/WeQ5OfTKxPp/cWRqu0AW1BBnrekVxj5IcEAsZ0u1dSShrvMbQ==
Received: from BN9P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::9)
 by DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 27 Aug
 2026 07:46:37 +0000
Received: from BN3PEPF00022BBC.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::58) by BN9P221CA0002.outlook.office365.com
 (2603:10b6:408:10a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Thu, 27
 Aug 2026 07:46:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF00022BBC.mail.protection.outlook.com (10.167.248.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 07:46:37 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 27 Aug
 2026 00:46:17 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 27 Aug
 2026 00:46:16 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Thu, 27
 Aug 2026 00:46:09 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
	<ecourtney@nvidia.com>, <apopple@nvidia.com>, <cjia@nvidia.com>,
	<smitra@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH v2 1/1] gpu: nova-core: correct FSP secure boot documentation
Date: Thu, 27 Aug 2026 10:46:00 +0300
Message-ID: <946dfa1de304b261950739c6e3da1e2d75eb3525.1787816400.git.zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787816400.git.zhiw@nvidia.com>
References: <cover.1787816400.git.zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBC:EE_|DS7PR12MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: f852ba6b-6f67-4218-b239-08df040f5329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|7416014|376014|36860700016|18002099003|22082099003|3023799007|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	3/OrAx72KOQmbWn/p2MAATZ9qKOTqOtLUO8tK/7K94hOYVgnezrtmN0pY02RmCZamSBSc08FQQMW0M3c9ZpOEkPwCs8WYgZb5MKznPH/r12AF76hWOIcrR13SpRZNVdfCWqk2kWoQvnzAnbPbjOhzKiT8KzP1eGkECkfFrFEtY1znCvTwCl37UL8a16ZOMU2iBL9iHHM/KeZAaMROou89fMkP5Uip4QeVCPUTDQgZs+9qLIwlG1XjeRV8nM8gazsnd94BdcONluT2bEteV+BD//BH+CKNR+2BF1eo8sBMFzZmTJSrfrbsHAyJH8erogjGpTdsY5QVZPvi4GtxF/ACqdW0dkCW2XAdaVQZRAaDrbNraJ1IBWhMtThmjkrTn5BkGN/EsPyk4peznInlx9pBX9/gi4/WkabZwJtAd/H5eJA4DtXHUMIlEq+PzoF2tSdfI/tVOSm2Qh95xk84VR/Wxo1SAUwfnsAO0nyAekW9o3GopWCBCk3rZe4JM0kQOh8qR8zY+20A4QFCKuDH4Ods/1bU9dJ2RSeRcQsj0GqTYETfemdntZi8km8cqfF/aAkbnGvgPuTwmyEOArRSpclEmt2HQGuAC2zui1LcufnGztg+W6wd+X519Ked5B9wqJKz/Yw8RgVxr9jcx0ZF5bA7tWLcA/l0ZPRijPSAR833H4CcqSBSpl3Czv/45KHDtMP/krh0IntHF0dMxp9npodUA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(376014)(36860700016)(18002099003)(22082099003)(3023799007)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tgouwUr5NVEsPsv8Oz4JsZnW4StzMFTHNsTMakFughkOVUGGbpf/1yP6KuHgveJ0fmQYJ3OhyFtit3Wr5joAVXuSE36j6ThiuPei8vrnnoQ6yxbqPSI90TQyFKIUYob2NeJWuUEYoAPGpVEy6FSXs8g3EeeJFlg1JamkVMzZLRhmRttxuIikZZdt7wPrlkTloRWfbTiDBFTpJawgPNq/Drrfi6hyxXJ6jQOpFx8W9vv6PEq/vCXZzN3zr0GHdiu5MfzIH5SV5WgNeI+bV2/FJS9RpHRJOzCQzcDqDcnqGkNtsivQoSJSUwcRdL1tYnNSI1x9aknwv1La6s22gBUFQyiM3nP2ovB6MKz7L2fSWIwSRYRcKrIkkFfKo9DJ0e2Ko8r2eUV0rwKlkn54s0Lxmg8JIOYNz9GZid9RYD8pB82Cxd23tRnoRK2YY32mrhtM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 07:46:37.4071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f852ba6b-6f67-4218-b239-08df040f5329
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5766

The FSP documentation still blurs the roles of FSP, GSP BootROM,
and GSP-FMC in the common Hopper/Blackwell dGPU boot path. It also
uses incorrect expansions for FMC, NVDM, and FRTS, and describes
GSP-FMC as an ELF image, while nova-core loads it from a TLV firmware
file.

Correct those terms and show the FSP-to-GSP handoff in the existing
message-flow diagram. Clarify that the COT response reports command
status only, and scope the SEC2 and PRC descriptions to the dGPU
platforms covered by nova-core.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 Documentation/gpu/nova/core/fsp.rst | 88 ++++++++++++++++-------------
 1 file changed, 50 insertions(+), 38 deletions(-)

diff --git a/Documentation/gpu/nova/core/fsp.rst b/Documentation/gpu/nova/core/fsp.rst
index 52d618d22bb8..bebe3c8ede2a 100644
--- a/Documentation/gpu/nova/core/fsp.rst
+++ b/Documentation/gpu/nova/core/fsp.rst
@@ -3,8 +3,8 @@
 ===================================================
 FSP (Foundation Security Processor) and Secure Boot
 ===================================================
-This document describes the role of the FSP in the GPU boot sequence on
-Hopper and Blackwell GPUs, and how it differs from the earlier Ampere boot
+This document describes the role of the FSP in the common boot path for
+Hopper and Blackwell dGPUs, and how it differs from the earlier Ampere boot
 flow. It also provides a brief overview of the PRC (Product Reconfiguration
 Control) protocol used to query device configuration through FSP. As with
 other documents in this directory, the information is subject to change and
@@ -42,18 +42,20 @@ On **Hopper/Blackwell** GPUs, FSP replaces this multi-stage process with a
 single message-driven interface::
 
      FSP (hardware root of trust, boots from ROM)
-          -> FMC (Falcon Microcontroller, verified by FSP)
-               -> GSP-RM (verified and loaded by FMC)
+          -> GSP BootROM
+               -> GSP-FMC (First Mutable Code, running on GSP)
+                    -> GSP-RM (verified and loaded by GSP-FMC)
 
-The driver only needs to:
+At a high level, the driver:
 
 1. Wait for FSP to complete its own secure boot (polling a scratch register).
-2. Send a Chain of Trust (COT) message to FSP with the FMC firmware location,
-   cryptographic signatures, and GSP boot parameters.
-3. FSP authenticates the FMC firmware and boots it, FMC in turn loads GSP-RM.
+2. Send a Chain of Trust (COT) message to FSP with the GSP-FMC firmware
+   location, cryptographic signatures, and GSP boot parameters.
+3. Wait for the FSP command response, then for later GSP-side boot milestones.
 
-There is no SEC2 involvement, no Booter ucode, and no FWSEC-FRTS stage. The
-entire secure boot is driven by a single FSP message exchange.
+In the dGPU path described here, SEC2 and Booter ucode are not used to bring
+up GSP-RM, and FWSEC-FRTS is not run as a separate stage. The driver initiates
+secure boot through a single FSP message exchange.
 
 Chain of Trust (COT) protocol
 =============================
@@ -62,39 +64,49 @@ ensuring the GPU reaches a known, trusted state.
 
 The driver communicates with FSP using a message queue (Falcon MSGQ
 interface). Each message consists of an MCTP (Management Component Transport
-Protocol) transport header and an NVDM (NVIDIA Vendor Defined Message) header,
+Protocol) transport header and an NVDM (NVIDIA Data Model) header,
 followed by a protocol-specific payload.
 
 For Chain of Trust, the payload includes:
 
-- The system memory address of the FMC firmware image.
-- Cryptographic material: a SHA-384 hash, RSA-3K public key, and RSA-3K
-  signature extracted from the FMC ELF firmware.
-- FRTS (Firmware Runtime Services) region information (vidmem offset and size).
+- The system memory address of the GSP-FMC firmware image.
+- Cryptographic material extracted from the GSP-FMC TLV firmware: a SHA-384
+  hash, RSA-3K public key, and RSA-3K signature.
+- FRTS (Firmware Runtime Security) region information (vidmem offset and size).
 - The system memory address of the GSP boot arguments structure.
 
-FSP verifies the signature against the provided public key and hash, and if
-verification succeeds, boots the FMC. The FMC then authenticates and launches
-GSP-RM.
+FSP validates the COT payload and authenticates the GSP-FMC image using the
+supplied cryptographic material. It then stages the image in GSP memory and
+triggers GSP BootROM. GSP BootROM authenticates and starts GSP-FMC, which then
+authenticates and launches GSP-RM.
 
 The message flow is::
 
-     nova-core                          FSP
-        |                                |
-        |  1. Poll scratch register      |
-        |  (wait for FSP boot complete)  |
-        |                                |
-        |  2. COT message  ------------> |
-        |     (FMC addr, signatures,     |
-        |      boot params)              |
-        |                                |
-        |                                |--- Verify FMC signature
-        |                                |--- Boot FMC
-        |                                |--- FMC loads GSP-RM
-        |                                |
-        |  3. COT response <------------ |
-        |     (success/error)            |
-        |                                |
+     nova-core                         FSP                    GSP
+        |                               |                       |
+        |  1. Poll scratch register     |                       |
+        |  (wait for FSP boot complete) |                       |
+        |                               |                       |
+        |  2. COT message ------------> |                       |
+        |     (GSP-FMC addr,            |                       |
+        |      signatures, boot params) |                       |
+        |                               |                       |
+        |                               |  Verify GSP-FMC       |
+        |                               |  signature            |
+        |                               |                       |
+        |                               |  Load GSP-FMC image   |
+        |                               |  -------------------->|
+        |                               |                       |
+        |                               |  Trigger GSP BootROM  |
+        |                               |  -------------------->| GSP BootROM
+        |                               |                       | starts GSP-FMC
+        |  3. COT response <----------- |                       | GSP-FMC
+        |     (command status)          |                       | verifies and
+        |                               |                       | starts GSP-RM
+        |                               |                       |
+
+The COT response reports only the FSP command status; it does not indicate
+that GSP-RM is ready.
 
 FSP message format
 ==================
@@ -107,7 +119,7 @@ All FSP messages share a common header format consisting of two 32-bit words:
 - Bits 29:28: Packet sequence number
 - Bits 23:16: Source Endpoint ID
 
-**NVDM header** (NVIDIA Vendor Defined Message):
+**NVDM header** (NVIDIA Data Model):
 
 - Bits 6:0: MCTP message type (0x7e = vendor-defined PCI)
 - Bits 23:8: PCI vendor ID (0x10de = NVIDIA)
@@ -127,9 +139,9 @@ Each knob has two values:
 - **Active**: the currently effective value for this boot cycle.
 - **Persistent**: the value stored in InfoROM, applied on subsequent boots.
 
-The nova-core driver uses PRC to read the vGPU mode knob (object ID 0x29)
-during early boot, before firmware loading, to determine whether the GPU
-should operate in vGPU mode.
+On Blackwell and later dGPUs, nova-core uses PRC to read the vGPU mode knob
+(object ID 0x29) during early boot, before firmware loading, to determine
+whether the GPU should operate in vGPU mode.
 
 The PRC message format follows the same MCTP/NVDM header structure as COT,
 with NVDM type 0x13. The payload contains:
-- 
2.53.0

