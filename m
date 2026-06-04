Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF79407590
	for <nova-gpu@lists.linux.dev>; Thu,  4 Jun 2026 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573492; cv=fail; b=PTLjZUUlaxqpjZt1rklcaiohYDQH1Q8iIQSyfdQrePCVNi+SRKsZ7+8YYUQp9PCBHJis14Mqa8lyc1zZMDNcbtGaW1STDcN06zqq2wftII8v7G4amO28uwV3hLVs4jEkMv86FLMjgxuRUnKOK/gUsnQA6dPtm3hl7oB72KSSDVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573492; c=relaxed/simple;
	bh=MmA08EJ0P8SiEovcFGOUCGvMuN5KRMvGo2dyNSmZO3U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s7dZXJxxMAqwO+c57i652qWa1xUN73wVtBz+m2EoYZ5YRU/KwsoIhdszCrN+u9EDO/CrDEMv5lA/adSsyt7PrD6YxSihjEEbbXmjDYK2NDOqn8xvX/hVn16iu6jjCJWkr1dgQmYJtWt1ghh5YMRYh6jJ6K/hyBSdMaXbPqtSbEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E8dQWPvs; arc=fail smtp.client-ip=52.101.43.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E8dQWPvs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYVdRM8+98VR1nWWU0ICniM0KFsCoTQt6IpAmfgXETgBqmThwbf35LHOFgYUULdKfxWfoDyMPhK+9o4NRv5n1tpaXSOjYZBJLK2USSHBRAAh9SNPY735o2bvCVJiFiB4BvmzvuZ5x5GEKNBXCW6XTBLapUoIji6mgMqmM+IPtMsYmL/xB5qqx1FE9H3DxtvacSQv2t3jUlN9hOdtTTVWz+O+v2Ygab3IEe3SqsZRHNHmAxXqjKAgF5jK32TMf1QOtz51//E2gW22ls7ES32PJqdR2GyJ19BWNBpjAocsmk9vtqNXWc4YGUGHt/KNCJEW/tfXoPHXRTB3dbVeOGDdkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYPrghxIO8NuBcowYn005NOesFR/79BgBTuOknMGmGw=;
 b=BDigLDGdsPflVWdndjJTlMdifwe2rceMkq/MjH+B87EwutFlCIGd0UAqFVwd/UWKJwagnseLjk7gyqxWoNjH0Tu5YrZwS+6MoNbihfGTAWw/kx0QAjGL+jWwpDTR3JIq65VyWdwUsVNi/vXUNOgjGaQMmVa6jE880XNWeNn58NuJZTRHMleGgYpuAP/WohQLjfKqXKqrHiEJys96XEa1JCscdXYSU+6ZSqV5XrlZ/HqnxbddMR/yiQ+ntkPL2hI3ewf7VAaiJASRwg9/otH3f7y4bkADYVGQH4R2A6uogcsxJljww1sI8UduAxFZIuMZyCKDPtINDdh+DeNXL8RlRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYPrghxIO8NuBcowYn005NOesFR/79BgBTuOknMGmGw=;
 b=E8dQWPvs2+aN8PBTBcG08EsqdOEzfIBkw98Gy5AuqjR20BKo/KOWh7eNOGkQS3hK15ArGZ9YI6tj42gKkMRecGPoB1CGZ7YY9UbDAiXCOoEoyJh2I/kUpPp7Ibivrj/64JP49j4jDSq0nXaiX2ScI0BT12CQx+ssUndtiaz57BmzxktwiPRNzuuLK34Q0zBJ9Bpgo3sUlZH0DaaQ28ZBceUn71YVrVtmz4KSeDsUMw2VcOaqcxjjOxnJ+YqDcymwTwgay7iqQx4Ibj6JLwR8zm9Th+NnTcLfqvfXgxd8RnYPdjUryPWzmnscrYbr69SJfKmGNNU+JhS8XLT8fBm9/Q==
Received: from PH8P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::6)
 by PH7PR12MB7233.namprd12.prod.outlook.com (2603:10b6:510:204::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 11:44:46 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:510:2d7:cafe::72) by PH8P222CA0021.outlook.office365.com
 (2603:10b6:510:2d7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 11:44:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.2 via Frontend Transport; Thu, 4 Jun 2026 11:44:45 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:44:31 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:44:30 -0700
Received: from inno-dell.mtl.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Thu, 4 Jun
 2026 04:44:23 -0700
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
Subject: [PATCH 4/9] gpu: nova-core: read vGPU mode from FSP via PRC protocol
Date: Thu, 4 Jun 2026 14:43:34 +0300
Message-ID: <20260604114339.1565660-5-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|PH7PR12MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: dd639216-21f7-43a4-1df2-08dec22eacfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|22082099003|18002099003|6133799003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	lJBMu6/3jwSlCJ6lKPUddBsszEiK5XMR55YJH9VShNV7i6YTQuhe/wDzYBb05plrZSeMNEvd7as8Po4UdWLG2Nf3xGc7u3DUMa2KCTqYlbNfF7H4xdJ1gExmuyGzik/1Amd39JsrF7VX/7G94XNWybQuf1KYF6VNqdfVqIuXzQ7yKWDvt5B/J4mu8Oz1+MnKlu45DT1gmZ5q2CdPFIM6SqhpTXMcC7mUFM7bUpavfq4dV866IZ+icDFTsjVTKEttsvA95YR6tDRhqleZY0SHfINwGo4ME5OaO2T7M3qIOwMaBCUq9AiYqqTcueBBTQ0V20koX+r7kZAoU4s8IXWwyUUaKsx4xqBIa1Tg9uOMTZwWAbEj0Tk7TpQx1vBhKNcXrKm+GVUZDN+raWDpHI7+dNxaWq0x9B82rPHwQ1/9vuCbXa+cBQYUlFcv89Se6rFZ6qylZ8TZQF3Kw0l2L0uEhSS64oUbrisiOFoSuGJjsVVNfuNnkeBaQWwW1y0lj12teI+b1OMPwDLJ+3mc58txcx9snRkxSDShnNK+XxrF8G8UBGl31ruBUJm4Xn+lM1MiekJTcFPjK3H/QOhv4JiDU1qhkRFf+XfpvX/nc4aTroKYRIlCP2dItqlNCMqIYY2leZZK/1R5iWi++WpdFy64hM5eXBIjuK6lkveRdEQ6vD43qANpZEqtI4ta9J+oUpHdUbWvRCOz9xlkXINZUm8gZedd15wus+/8uaSV2XUBt/A=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5gsjThDKU8vnznbdQbnPD9XIh1ef6TF3jEusRt8Lz57obSS4IMgobO1lgHgrwH5MJWNubFQCjd7xYYr8jv3BxY7jXOzTCBGMlkwiqfwhKmEB7m4DmWk+sjgMEA5c55J2V4rBBTARmUKQRkRok1n7Ili1Uahzj04LUaPHX2wLCm+mGuIs2VIgKdHsgs/CsLESKkEHCDmmnCsuwE4DirA8NrBbY8NN9TAsQuwr8FcYjt58BeenIXSPia8wj0LeAfsVff5sTa/qvEzsBLEkTuMSvZrHyeX0c6evsndvnZpspZcbjuFPwGso5vkbBwBMxAwzbV9onzsZgSAPCtGM+qT/o7IKNRluOxRis78OAEJvj14SurBq9L14zSkIFFL6UCXCfIMGml9HExaeFOilrmLLPkwez+JCfMP9zhw53nWmKzBXDiN5GJIklyNcautiNI64
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 11:44:45.8443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd639216-21f7-43a4-1df2-08dec22eacfd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7233

Add support for querying the vGPU mode configuration from FSP using
the PRC (Product Reconfiguration Control) protocol. PRC is an API
system exposed through FSP's Management Partition that allows querying
device configuration "knobs" without firmware updates.

Add a VgpuMode enum that validates the raw PRC response value,
returning an error for unexpected values.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs  | 145 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/mctp.rs |   3 +
 2 files changed, 148 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 5fd2e9e277b1..ce11efeba37e 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -48,6 +48,44 @@
 
 mod hal;
 
+/// PRC (Product Reconfiguration Control) protocol constants.
+///
+/// PRC is an API system exposed through FSP's Management Partition that allows
+/// querying and modifying device configuration "knobs" without firmware updates.
+/// Each knob is identified by a unique object ID and controls a specific device
+/// behavior (e.g., vGPU mode, ECC, confidential computing).
+mod prc {
+    /// Sub-command to read a PRC knob value.
+    pub(super) const SUBCMD_READ: u8 = 0x0c;
+
+    /// PRC object ID for vGPU mode configuration (knob ID 41).
+    pub(super) const OBJECT_VGPU_MODE: u8 = 0x29;
+
+    /// Request the active knob value (currently effective this boot).
+    pub(super) const FLAG_ACTIVE: u8 = 1 << 1;
+}
+
+/// vGPU operating mode as reported by FSP via the PRC protocol.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum VgpuMode {
+    /// vGPU support is disabled on this GPU.
+    Disabled = 0,
+    /// vGPU support is enabled on this GPU.
+    Enabled = 1,
+}
+
+impl TryFrom<u16> for VgpuMode {
+    type Error = kernel::error::Error;
+
+    fn try_from(value: u16) -> Result<Self> {
+        match value {
+            0 => Ok(VgpuMode::Disabled),
+            1 => Ok(VgpuMode::Enabled),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
 /// FSP command response payload (`NVDM_PAYLOAD_COMMAND_RESPONSE`).
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
@@ -57,6 +95,39 @@ struct NvdmPayloadCommandResponse {
     error_code: u32,
 }
 
+// SAFETY: NvdmPayloadCommandResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for NvdmPayloadCommandResponse {}
+
+/// PRC message payload.
+///
+/// Sent to FSP to query or modify a device configuration knob.
+/// The response includes the common FSP response header followed by
+/// a [`NvdmPayloadPrcResponse`] with the knob's current state value.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadPrc {
+    sub_message_id: u8,
+    flags: u8,
+    object_id: u8,
+    reserved: u8,
+}
+
+// SAFETY: NvdmPayloadPrc is a packed C struct with only integral fields.
+unsafe impl AsBytes for NvdmPayloadPrc {}
+
+/// PRC response payload containing the knob state value.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadPrcResponse {
+    value_low: u8,
+    value_high: u8,
+    reserved1: u8,
+    reserved2: u8,
+}
+
+// SAFETY: NvdmPayloadPrcResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for NvdmPayloadPrcResponse {}
+
 /// Common MCTP and NVDM headers shared by all FSP messages.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
@@ -92,6 +163,18 @@ struct FspResponse {
 // SAFETY: FspResponse is a packed C struct with only integral fields.
 unsafe impl FromBytes for FspResponse {}
 
+/// Complete FSP PRC response including the knob state payload.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspPrcResponse {
+    header: FspMessageHeader,
+    response: NvdmPayloadCommandResponse,
+    prc_data: NvdmPayloadPrcResponse,
+}
+
+// SAFETY: FspPrcResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspPrcResponse {}
+
 /// Trait implemented by types representing a message to send to FSP.
 ///
 /// This provides [`Fsp::send_sync_fsp`] with the information it needs to send
@@ -178,10 +261,25 @@ fn new<'a>(
 // bytes are initialized.
 unsafe impl AsBytes for FspCotMessage {}
 
+/// Complete FSP PRC message.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspPrcMessage {
+    header: FspMessageHeader,
+    prc: NvdmPayloadPrc,
+}
+
+// SAFETY: FspPrcMessage is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspPrcMessage {}
+
 impl MessageToFsp for FspCotMessage {
     const NVDM_TYPE: NvdmType = NvdmType::Cot;
 }
 
+impl MessageToFsp for FspPrcMessage {
+    const NVDM_TYPE: NvdmType = NvdmType::Prc;
+}
+
 /// Bundled arguments for FMC boot via FSP Chain of Trust.
 pub(crate) struct FmcBootArgs {
     chipset: Chipset,
@@ -226,6 +324,53 @@ pub(crate) struct Fsp {
 }
 
 impl Fsp {
+    /// Read vGPU mode from FSP using the PRC protocol.
+    ///
+    /// Queries FSP's Management Partition for the active vGPU mode knob value.
+    /// Returns [`VgpuMode::Enabled`] if vGPU support is active on this GPU,
+    /// [`VgpuMode::Disabled`] otherwise.
+    #[expect(dead_code)]
+    pub(crate) fn read_vgpu_mode(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        bar: Bar0<'_>,
+    ) -> Result<VgpuMode> {
+        let msg = KBox::new(
+            FspPrcMessage {
+                header: FspMessageHeader::new(NvdmType::Prc),
+                prc: NvdmPayloadPrc {
+                    sub_message_id: prc::SUBCMD_READ,
+                    flags: prc::FLAG_ACTIVE,
+                    object_id: prc::OBJECT_VGPU_MODE,
+                    reserved: 0,
+                },
+            },
+            GFP_KERNEL,
+        )?;
+
+        let response_buf = self.send_sync_fsp(dev, bar, &*msg)?;
+
+        let prc_resp_size = core::mem::size_of::<FspPrcResponse>();
+        if response_buf.len() < prc_resp_size {
+            dev_err!(
+                dev,
+                "PRC response too small: {} bytes (expected {})\n",
+                response_buf.len(),
+                prc_resp_size
+            );
+            return Err(EIO);
+        }
+
+        let (prc_response, _) = FspPrcResponse::from_bytes_prefix(&response_buf[..]).ok_or(EIO)?;
+
+        let raw_value = u16::from(prc_response.prc_data.value_low)
+            | (u16::from(prc_response.prc_data.value_high) << 8);
+
+        VgpuMode::try_from(raw_value).inspect_err(|_| {
+            dev_err!(dev, "unexpected vGPU mode value: {:#x}\n", raw_value);
+        })
+    }
+
     /// Waits for FSP secure boot completion, then returns the [`Fsp`] interface.
     ///
     /// Polls the thermal scratch register until FSP signals boot completion or the timeout
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 482786e07bc7..b203c632bf20 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -13,6 +13,8 @@
 #[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
 #[repr(u8)]
 pub(crate) enum NvdmType {
+    /// PRC (Product Reconfiguration Control) message.
+    Prc = 0x13,
     #[default]
     /// Chain of Trust boot message.
     Cot = 0x14,
@@ -25,6 +27,7 @@ impl TryFrom<u8> for NvdmType {
 
     fn try_from(value: u8) -> Result<Self, Self::Error> {
         match value {
+            x if x == u8::from(Self::Prc) => Ok(Self::Prc),
             x if x == u8::from(Self::Cot) => Ok(Self::Cot),
             x if x == u8::from(Self::FspResponse) => Ok(Self::FspResponse),
             _ => Err(value),
-- 
2.51.0

