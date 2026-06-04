Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD2341C2E8
	for <nova-gpu@lists.linux.dev>; Thu,  4 Jun 2026 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573506; cv=fail; b=O266OnvF4JUksDyGr8uez4qOQZnFoZRcbiAs/R/Ifz8MKFxeCJ0TdnU0uca04L3LoAhPmVaPXJXmzCvancr+0U9kNwjXRGUJseQVp1pTauzRep/kMZ3jPLIQVjRWT0VLNIxTvCswtE/1e2JJHIh/dD5VGGAp5eITmVAEyp2OaXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573506; c=relaxed/simple;
	bh=TQwvz80BP6jdIhMBGM9UzzRgq1W6cWuAzfai8jEc9Is=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EM1eVoRIXfmY55kGnxjqe0/YkHZz2bXfcBO2PGZUa0gEfxHalU/Aviz4o7kOtVCcyazpEeaFseHdD1bKI5fEykFhBxZZ24opLC7M/aOYO97jVbepH9KhPJev+R8G/FxEhcZkLLK//6ltM4zQoBeYcRsA4NNxGhhKfM2WhaoJKaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tybh5Dbq; arc=fail smtp.client-ip=52.101.85.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tybh5Dbq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGLWm3TxIpnMOemtx4x8hQVlfD0IghOcKed4c7XE9RqU6I0yAxNafDvX03WRucd/XxOimuR8BG2lJiJ6d1V91H+X7BOHBbBhwfSqk0DtK450Q3ZU2cydX+dbz1rxIL02WTia+UdOcO1b1ZGiaQAu52xJ+tdoELc7dSqZjC7V0cKYqjmAunuzqlQDYbnjwszM60iUEVIwosqpgco7xsbd6VMWTwqGyHulRxPKhIiUuO1WtARXD4uQQdZ2tTPuZhm8iOzfV17BmACe6/Pxe3MPd3It37F0ONV3nXgBBfkucGlkAJ1oBEJXsG3ZSt5fY9yN2nRbT0xXOvQF4PwNfdSpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1181+t4yhgt8RVmJr5byh410JuqwrZD0rGDk5kAPis=;
 b=ndGawzVRR5jtHj4Nlfx7C4ob9ChFrHUmP94fhTb3YSMBBvvnYVesjOc/9VVcukaWKISkTRBv13OFehpV94NhWxYOfsKgIuwqD2MC70vhr8kxFiDBUaEOqimJUGMEfdY9tvTR46CBgT2x+LOf5EewaruMlp3pgDWSL2REhz7RSpzxnh+vdtoje70SjW8rUBCOJ6t+/o1dZ7ixpoDI3wQfwqISNH74QAGqMeRYhPaWAIREYI/lJD/ubxpwiepSNxOoG/1D2YI6t8zMS6hpDeTX31MN38z8MAP61lM5b68KNqYgGWdRRCcxTFsX0ocJMMYv4t7qli3d8RKQQFB+Fpgepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1181+t4yhgt8RVmJr5byh410JuqwrZD0rGDk5kAPis=;
 b=tybh5DbqJW8k13286LXzWGSEPZyqv1lnbfWy4zBZ2V+fzvxfYrt0nh8E8N4WTbdraF/079+jWtPBOKzn5lICJYU3pKKOQBgwG0YRgcMYgVOJw13ge9EVB+4xl258MOxBotPVgLtcvVj3elwMe2f4qudPYzzlrt4WvgOZtKqtsLYB431uqjpH/Vgfcn1iztQFAOvTTTPW5zxpJysUH0ROumBiySLSRkKzRx3uPxNG9Bo/TWlqqw2b5utq4AoT+Ei+xFr1aSP+4hrBT2TOapMh7TRtYB9vhUN8JJkEtbkqJwKK061QwFMyrH6kaTeVzouopZx57UlmJdqL2D3bqbY0+g==
Received: from PH8PR20CA0021.namprd20.prod.outlook.com (2603:10b6:510:23c::26)
 by CHXPR12MB999221.namprd12.prod.outlook.com (2603:10b6:610:2fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Thu, 4 Jun 2026
 11:44:58 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:23c:cafe::60) by PH8PR20CA0021.outlook.office365.com
 (2603:10b6:510:23c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 11:44:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.2 via Frontend Transport; Thu, 4 Jun 2026 11:44:57 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:44:39 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:44:38 -0700
Received: from inno-dell.mtl.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Thu, 4 Jun
 2026 04:44:31 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
	<jhubbard@nvidia.com>, <acourbot@nvidia.com>, <ecourtney@nvidia.com>,
	<joelagnelf@nvidia.com>, <apopple@nvidia.com>, <cjia@nvidia.com>,
	<smitra@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 5/9] gpu: nova-core: add FSP and PRC protocol documentation
Date: Thu, 4 Jun 2026 14:43:35 +0300
Message-ID: <20260604114339.1565660-6-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260604114339.1565660-1-zhiw@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|CHXPR12MB999221:EE_
X-MS-Office365-Filtering-Correlation-Id: 807fc945-ee44-40b9-5e5d-08dec22eb3fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|56012099006|11063799006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uPFhZflJLI8pmD+pGD/kodVonZVx7FOz+a0YF1UsaSO0sqfIAyAVLlPb5He3dbbDrH68YST38ldql4+xL1X8r7ECKNoEq/M8MRlamJWdypqCkhHeFECxoYDLEInNkELW4rAazqe81sk8L6XVoajwfwruLD9Z0tM5R1X1xU+O7+b5t6Yfl047R2bYtJ6sMcEa+PhzxDpfxGzee6iBzMG7W6xA3pG7pYyVW8kr3QMFDJjCyXziuKkfsk+ke6tIwcWR4hXYLf7IxQaUOQ+wjKvz239Uyv1hjSVdfSaF9LtA+ZjvnUJLxP4Gw0DT2W3OTEDzsUjlA9kWUrIBvK1L4ledwWVgDGQSuu09Wz9DCVdkHLBSvdHz+d1sUsudc8fdcP+itecjeT1UrJuSXe+C59CIdokHoVyPoC72ShgrE1S6XTkCVudiFXxzLpcag+dKJsyDhKW9DO+l3xbWTOaZFJ1jKPxvrSJB/ahOvQp4EqDPaHowtf4M+czho+E8I3Gnb5hiZK+LDf0Lesa54rYeASds8Iw2Gy5VODFjBgYsGPPET1bSTFAMLaQO9O7u8pT5blAe9KZXyLe78M9fUnEOS78N9FC8aujLV4bbnaVX11NNUW5KSqOYAsP6uBcubj5C12BXCELUS4EV/38+oo6q+npv9cxmue+t3X7m4+nDZ4e0Kt7j0NUlWsM2Xji+I5LBkmBLa0cMjMkxAcrPQmwa3z1h/3F+xL+ISNlt6DXFubpzH/E=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	50isJE1wjze/3OlKIosr7QUsfLSUyXIrJENKNRROPChpM4KfX2Xenr3sT0HoSmDOeywA23Mjl5urupmPY2dL6ewmt0YVIMK0goBS8HLSQ1e0K2kebaVEnOndcm2yKewIVZP12+mZhbi3w0Mj5uvcKzEMUIPElwDdVngz8LiiWuLpArVu5k/w/3uraC+2WoCDShAFexhDHeMrXfbI8DCSWPTQ7tuVPl2cxV4WXuEj8ogXn8Fc70OVa53Yx3x3qjyaF/0eXwXL3+S7Zp6FCZloiDNwzun/E5clj4g2F2NWsRK0h/1S0UaOV1ZoU5Ivs9SKoIVC0Y+yLiHMnwuvfeJxltwLjqjtYM4QtDHRgeav8asNCRvNQ2fp/u65rSmDIM2inbxVo3VMFQhXqZ0y/KemXVEgWzMuXLG4OVIB4M4snZqiWfqGxwsAaGG3gqYqi4TN
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 11:44:57.6264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 807fc945-ee44-40b9-5e5d-08dec22eb3fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR12MB999221

Add documentation for the Foundation Security Processor (FSP) interface
covering the simplified Hopper/Blackwell boot flow, the Chain of Trust
(COT) message protocol, the MCTP/NVDM message format, and the Product
Reconfiguration Control (PRC) protocol used to query device configuration
knobs such as vGPU mode.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 Documentation/gpu/nova/core/fsp.rst | 142 ++++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst    |   1 +
 2 files changed, 143 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/fsp.rst

diff --git a/Documentation/gpu/nova/core/fsp.rst b/Documentation/gpu/nova/core/fsp.rst
new file mode 100644
index 000000000000..52d618d22bb8
--- /dev/null
+++ b/Documentation/gpu/nova/core/fsp.rst
@@ -0,0 +1,142 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================================
+FSP (Foundation Security Processor) and Secure Boot
+===================================================
+This document describes the role of the FSP in the GPU boot sequence on
+Hopper and Blackwell GPUs, and how it differs from the earlier Ampere boot
+flow. It also provides a brief overview of the PRC (Product Reconfiguration
+Control) protocol used to query device configuration through FSP. As with
+other documents in this directory, the information is subject to change and
+is intended to help developers understand the corresponding kernel code.
+
+What is FSP?
+============
+The Foundation Security Processor (FSP) is the GPU's Internal Root of Trust
+(IROT). It is a dedicated security processor that boots from immutable ROM
+(Boot ROM) inside the GPU and is responsible for establishing the Chain of
+Trust before any other firmware is allowed to run.
+
+FSP runs independently of the host CPU and starts executing as soon as the
+GPU is powered on. By the time the nova-core driver is loaded, FSP has
+already completed its own secure boot and is ready to accept commands from
+the driver.
+
+Simplified boot flow (Hopper/Blackwell)
+=======================================
+Starting with Hopper, the boot flow is significantly simplified compared to
+earlier GPU generations like Ampere.
+
+On an **Ampere** GPU, the boot verification chain involves multiple Falcon
+engines and multiple ucode stages (see falcon.rst for details)::
+
+     Hardware BROM (SEC2)
+          -> HS Booter (SEC2)
+               -> LS GSP-RM (GSP)
+
+The driver must extract ucode from VBIOS, manage SEC2 and GSP, and
+orchestrate the Booter to load GSP-RM. This involves FWSEC-FRTS, devinit,
+and the Booter stages.
+
+On **Hopper/Blackwell** GPUs, FSP replaces this multi-stage process with a
+single message-driven interface::
+
+     FSP (hardware root of trust, boots from ROM)
+          -> FMC (Falcon Microcontroller, verified by FSP)
+               -> GSP-RM (verified and loaded by FMC)
+
+The driver only needs to:
+
+1. Wait for FSP to complete its own secure boot (polling a scratch register).
+2. Send a Chain of Trust (COT) message to FSP with the FMC firmware location,
+   cryptographic signatures, and GSP boot parameters.
+3. FSP authenticates the FMC firmware and boots it, FMC in turn loads GSP-RM.
+
+There is no SEC2 involvement, no Booter ucode, and no FWSEC-FRTS stage. The
+entire secure boot is driven by a single FSP message exchange.
+
+Chain of Trust (COT) protocol
+=============================
+The Chain of Trust establishes a cryptographically enforced boot sequence,
+ensuring the GPU reaches a known, trusted state.
+
+The driver communicates with FSP using a message queue (Falcon MSGQ
+interface). Each message consists of an MCTP (Management Component Transport
+Protocol) transport header and an NVDM (NVIDIA Vendor Defined Message) header,
+followed by a protocol-specific payload.
+
+For Chain of Trust, the payload includes:
+
+- The system memory address of the FMC firmware image.
+- Cryptographic material: a SHA-384 hash, RSA-3K public key, and RSA-3K
+  signature extracted from the FMC ELF firmware.
+- FRTS (Firmware Runtime Services) region information (vidmem offset and size).
+- The system memory address of the GSP boot arguments structure.
+
+FSP verifies the signature against the provided public key and hash, and if
+verification succeeds, boots the FMC. The FMC then authenticates and launches
+GSP-RM.
+
+The message flow is::
+
+     nova-core                          FSP
+        |                                |
+        |  1. Poll scratch register      |
+        |  (wait for FSP boot complete)  |
+        |                                |
+        |  2. COT message  ------------> |
+        |     (FMC addr, signatures,     |
+        |      boot params)              |
+        |                                |
+        |                                |--- Verify FMC signature
+        |                                |--- Boot FMC
+        |                                |--- FMC loads GSP-RM
+        |                                |
+        |  3. COT response <------------ |
+        |     (success/error)            |
+        |                                |
+
+FSP message format
+==================
+All FSP messages share a common header format consisting of two 32-bit words:
+
+**MCTP header** (Management Component Transport Protocol):
+
+- Bit 31: SOM (Start of Message)
+- Bit 30: EOM (End of Message)
+- Bits 29:28: Packet sequence number
+- Bits 23:16: Source Endpoint ID
+
+**NVDM header** (NVIDIA Vendor Defined Message):
+
+- Bits 6:0: MCTP message type (0x7e = vendor-defined PCI)
+- Bits 23:8: PCI vendor ID (0x10de = NVIDIA)
+- Bits 31:24: NVDM type (0x14 = COT, 0x13 = PRC, 0x15 = FSP response)
+
+PRC (Product Reconfiguration Control) protocol
+===============================================
+PRC is an API system exposed through FSP's Management Partition that allows
+querying and modifying device configuration without firmware updates.
+
+Configuration parameters are called "knobs". Each knob has a unique object
+ID and controls a specific device behavior. Examples include vGPU mode, ECC
+enable, confidential computing mode, and NVLINK configuration.
+
+Each knob has two values:
+
+- **Active**: the currently effective value for this boot cycle.
+- **Persistent**: the value stored in InfoROM, applied on subsequent boots.
+
+The nova-core driver uses PRC to read the vGPU mode knob (object ID 0x29)
+during early boot, before firmware loading, to determine whether the GPU
+should operate in vGPU mode.
+
+The PRC message format follows the same MCTP/NVDM header structure as COT,
+with NVDM type 0x13. The payload contains:
+
+- A sub-command (e.g., 0x0c for read).
+- Flags indicating which value to read (bit 0 = persistent, bit 1 = active).
+- The knob object ID.
+
+The response includes the common FSP response header (with error status)
+followed by the knob's 16-bit state value.
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index e39cb3163581..1783513cbd05 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -30,5 +30,6 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/todo
    core/vbios
    core/devinit
+   core/fsp
    core/fwsec
    core/falcon
-- 
2.51.0

