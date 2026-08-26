Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC36443BDB3
	for <nova-gpu@lists.linux.dev>; Wed, 26 Aug 2026 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755132; cv=fail; b=ryRjOXH49VXWmHjYgLZyNT3CVf11g85grVg9+z8dcvL+sXKZqiEYaGra4PxWK6CbUTCtfghTpChvqZA+wV+n5rACx3Y/Ai97htHWOuw1w0KvDYszryH87/klhwm5vIfmRyQ0+B81oPTOYx+gwJzMJEqesFrpBcDHIbhwHNFmSZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755132; c=relaxed/simple;
	bh=f/FTRZ0C8fenAwOOPrlXqRhPEpqPI7bi1P4YwR4nsTg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MIIn//RrtapbeB1euFp5IndD5yHbHKQ8atLUuDdGM+x0MbFEPygtSpew0j1LD13w7a/P/lzDVDtOFM19//95TZ4OuzCQSu0KeQixzeBjxViqnY7y03GIKclqHGkUlYzgncH7y5zLYKOD54x+YKLcUCqWbCmDK+LzDSwiUWlUZPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZHyLsxYC; arc=fail smtp.client-ip=52.101.57.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZHyLsxYC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbYnslGyw/MfORzhwxx2RGAR3qYouD+grPiqW/kbPRSl90upp/jydqm1CTfKzr4QqkBKRtiWGy1jymivljfotMoM1d3u9jypBFl0HXKBYMGWHLccYMS2dOPVLw/8vr31HVLK/f3xpBZcGyAE7MIWn7pI7qXVIVoS2FjIG08TFf8C8TeXemFHkORXqWxGwvicMXrctpGKCuRnvsSP4MwJOxNWDOA/9eiNBfu+ObXnIw0CxuM6Ss/TiVNr/UF0A1r8EVvPgicYUv0B4Wt8pbB9JSPIQyNpVHxhaTLwK3vAVpfvPwdWn3Sds5dFYqU+ljdkfTO8X3abvvw+IVOXF+14FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARR/AtbglsU7hzbvbzxxgf1dewsigwFsW/xyGXGVmVQ=;
 b=AYlu47Mz6ocNwLYGZLtNrnCyCGYfu/yEyMEvNdIOhrHr/9CnrphFfUMO90b4u/zmj+WSwAz0IktX4e9QqA0fG1wD2wXTDvSgiqd0lR0Q/rrj6EfBPgSlSutb5BS1MzXfcYu2wOWxRpy0CmPCngn9YuSua8V2u735V3XfiIXh1oL5p96Iw76l8vs5A9gljMgrlqjUGjobUTQbgKB2OamNj2VK1WYv1PqP89XJ4i7BOruHt0rdDxQ0xrsKtNXJjeLGOZsXrD0yJkpqlVktQbn+u0nwQFJ7c8DvQoellppSDeN83uHivevmna+QAdEQoxRsRfVed7Msdvs7ua6Yam1woA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARR/AtbglsU7hzbvbzxxgf1dewsigwFsW/xyGXGVmVQ=;
 b=ZHyLsxYCAzAkUSPwKZOB1XAwg6A3iYVDSTTdRH0JHSmbLoFRM8k2qMttRguGIIaFp3KPz8/4rHnPYZEZDcAN/PN1rHQhJ3Ev1/4smK5APREz0ls77DY2qE88ExQNVsoXDBUGN8ShOBDPLNkSTWrs+3moWkUwFk66lujNedN5xNYjl8usTwFcxi5hLbaVHPUM9/dt6RUgebRdfJ8H8NEbOc2Ae7cogWs2yeUOQ2v4R2YN3jjpxg9W6HR9hBKoH4148fNf0twba08bYnlTA5hb5J8O5AjBJvbT0zBrDn31PnsAjNfC4ESzO/0n7YiOBwtQ2HWcdXkVSKZFP6iAO/WX+Q==
Received: from SJ0PR13CA0013.namprd13.prod.outlook.com (2603:10b6:a03:2c0::18)
 by SA1PR12MB7320.namprd12.prod.outlook.com (2603:10b6:806:2b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Wed, 26 Aug
 2026 14:38:35 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::17) by SJ0PR13CA0013.outlook.office365.com
 (2603:10b6:a03:2c0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.7 via Frontend Transport; Wed, 26
 Aug 2026 14:38:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 14:38:35 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 26 Aug
 2026 07:38:06 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 26 Aug
 2026 07:38:05 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Wed, 26
 Aug 2026 07:37:58 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
	<ecourtney@nvidia.com>, <joelagnelf@nvidia.com>, <apopple@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 1/1] gpu: nova-core: correct FSP secure boot documentation
Date: Wed, 26 Aug 2026 17:37:46 +0300
Message-ID: <de054d8c5c1241fc600eb01aca34d6061429a174.1787754628.git.zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787754628.git.zhiw@nvidia.com>
References: <cover.1787754628.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|SA1PR12MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ecf7666-7901-4ad2-e1fb-08df037fb58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700016|376014|23010399003|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	TDCdoGf9jXxK6V8EJ1/h7igI0yrgjBdJO5FtTnXSKHN6d99gzEOKj3SuRTLRfLtwRuLcmDDM2/IAmO9CuWgt9yMJj0SneVMm5sdvwx7IoOtUwtOdAhktioZs7RoSN2Gt9YQ8PcNv8kyxWi5/kYZqb8f8vWgyCaza+n4y1+EaMwXxyXxobGVK1KlyGSW/aXmvPXNJ6wZgZTZY41xRRom6mVZx0buA8ZLOtWH/kEQu4PFhzbqEGgDCR2tGpDWBt2s8b+WQ1iCDN2clusfjS4qlcyM7p81hgnwN0PvaDeJLt1yw0TTXjuV9RpLiMqk/Y26/hvly1hXTqZe4iUXeIE0PcuATFWi8aDX9nBTSIX8cOBngXpnS4Rh0f0Tl3vL74zQSATXMJDT9FhZeX4UvYkkq8O/GUlWNCFzJ+gxb7iG9QonkQqeq/HdeRAz3dOeWwaugfHfZz17N+JJtphLk1RCZ498rQ9WTKsdy3ahPIrldOQcTt81LVfbPv8vsZN79DUJWymg4/rgf1nZuVwPTSVWXMFNxg5pZeaD2HE8RxO+YFopP1L0K+dM+MMFq/dumxfh/TTGOAbTJCjl9pkmLDBldQ/SBw96MlOa3RN+UAYrBxv4Xu2+TlR4uGUhM7crya7mJzUCccIHDJxSE8OxsC0KnH7+akMhA91iaPLNRqR5J2doYv4/LEd5PasnvAzTl1rdVc7VSCKR5SgN5HKKH42XxGw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Sxh+s9cNF/uBHMmGSslfClFKjpJKVF4ep4hdmnQ/zsp0Z3v+tpi4B7APLadAhHPXf8181cmo++AoqdmypDhVWliuoEiEinP4p+jMK7dh/nfI/BY/POtx+rcgZFWD5FbA4C6QDIKW6xQ8R5D0yh4xKMmpDpfKapx5rBAR141Y8fx7hm87nUNg5ocdWZa+JPTAlzaBPFEISRf23jnfHMFZSoFggS8HcznLhFmQu5rn6NQlef7ljTU5s2nSh1+KlVIzmnJDBHSNXWN0hLQDCQNnXZWpmiiiHNObVqIveChyXX2yA6o8ZEmjfhbx9jucMGYCYTWXj8HZ21/4qDvOlR3ELMtvMnANzO1QrDnft28MxfGhO7uW6+naZVDFz48+wiproWL0yPUjMo+kaC4jfr3Dr6IVWVCjFu8UtDPEVkd7I9cCaF0a/wkTdfxlZqKL7GRj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 14:38:35.0413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecf7666-7901-4ad2-e1fb-08df037fb58e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7320

The FSP documentation still blurs the roles of FSP, GSP BootROM,
and GSP-FMC in the common Hopper/Blackwell dGPU boot path. It also
uses incorrect expansions for NVDM and FRTS and describes GSP-FMC as
an ELF image, while nova-core loads it from a TLV firmware file.

Correct those terms and show the FSP-to-GSP handoff in the existing
message-flow diagram. Clarify that the COT response reports command
status only, and scope the SEC2 and PRC descriptions to the dGPU
platforms covered by nova-core.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 Documentation/gpu/nova/core/fsp.rst | 88 ++++++++++++++++-------------
 1 file changed, 50 insertions(+), 38 deletions(-)

diff --git a/Documentation/gpu/nova/core/fsp.rst b/Documentation/gpu/nova/core/fsp.rst
index cc2e3bbb9b53..bebe3c8ede2a 100644
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
-          -> FMC (First Mutable Code, verified by FSP)
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

