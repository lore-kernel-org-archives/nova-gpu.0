Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1593612F3
	for <nova-gpu@lists.linux.dev>; Wed,  1 Jul 2026 06:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887300; cv=fail; b=uqN+EaIWf4fN1Ry7ZEjZ1JP/9MU0yYGuWH83htthIu85KMJheCbYTcYzLUYvfcYPirnuarkDfZgrIJ3L++IWbZsd/Io+6LvK8g9SapY3rR/B0WupK37p2QAO0uU8sTHTAysirmUb67EvxGSZqJFjrYVYcQloVELUEsBlDxEuJTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887300; c=relaxed/simple;
	bh=2soh0HHQMYJ+auuD3hh/O1TlFKRiPFGr6nn/M0/jjYY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pm/H6YQUg2lkUSVjk7lrBB1ihlvIN2wRHlGzXE+TB4A2v0SyrvROuQjVtOFduEN+1IYpJrDTTt/u3LmZPPfy4fwThzaJkFul7ImFEveqVpzWgyrOsC8M2gUqGLJ9+nN348wWPeLVagHCe2DETkOge46C7u7qvHW69Pl1aE0j4UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lYzsUIWr; arc=fail smtp.client-ip=52.101.56.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lYzsUIWr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSGJ36JKwhEf07VX9CNUV366rfFYXgzpr+nzJg4NqcytcFhjh2l79Hb6AJrML3hCMBTtM1ECwScfUct8Syd6VSZCfVMZlRzeBd19Ln1h/a/uuGnAJI1xVPMUl4P9m2yB7Jdpv87eIjw3wZXXQglIpPCNkQSXNShRNj4iB8SNBdvC4UBAW18ta2Af6+fSISqtIl1oWAF8Tj4vCpv2wT6hIVRUHpX4JpqTERcAxrHuGAceq46+ai8t8f5iOPOsNUBqEObU1J6KYgO3jA43LU23Tz9JHbkqvxEQL8PawBsGYcUmotCzSM+v1bnakqZtBqVtJRklnQv8pC2whjZAsmsBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIG9ydgBZS0/+XHyWGS7kqiABVDIWtsIUC3/TZyfNqw=;
 b=ybCcW02Mrr6yN0ILkNEVK4Tcxuw1n3neky9PTsWmKyr3wi8MLgK43NdSiVbwTAUfhk3Z7t1c8x8NX3T/XcgF/aUiT+p9kJVgl2TURqQb7e1Ptys5xGHIoXCuOuwLyLdhRLUST3u5LIzCbDhaLAaLbSwiJ+o8bjVaOlAVNr9rDWPCgUUzUi7GWJ0whWKKwCS/mAlT4W62x5gpWEcb+N00tzvOxfRu/ERdUENb3S17xk6FGEiCEtdGUwOcmTASsHr15qF3j5WGSsy18rPhJx+YjXU6CDDFcbMWkarK9jv/lpO7lM7q86OyypnUfQeNpzMHo5uQqwoMQFKzC1sGDTRqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIG9ydgBZS0/+XHyWGS7kqiABVDIWtsIUC3/TZyfNqw=;
 b=lYzsUIWr0pTMw4qfZco4KN4h/OCuEbjpTwiR7SJS016FmlziyXtDhuRMXSxLVMx6CaaHfWoUZ5gv3QR2bs2dwWED/T2zV9ojOxibdpFwKjrIdGruVCSzAso07wmgCXX5asVjSN5mV3NO61cKmHYLYG94zYtfXLk/s7SZKL0WdIVQEvYD1ximbhlR4FZmfez2Q48qIiznrNhbhzGEgF2BkhuCrdSPVr8S5goK43mfxUXgcsRzkkhZPumzH8v410YzIP32F1ggdcK+HwiVSMYVawSqcWbnVTKPayBpBHvGP2TIGQZoVMTAUFgAbdPNd7v3e/9TxBVpL5e7C1dP6+FmsQ==
Received: from BY3PR10CA0023.namprd10.prod.outlook.com (2603:10b6:a03:255::28)
 by BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 06:28:08 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::a4) by BY3PR10CA0023.outlook.office365.com
 (2603:10b6:a03:255::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 06:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 06:28:07 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:27:42 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 23:27:41 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Tue, 30
 Jun 2026 23:27:32 -0700
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
Subject: [PATCH v3 6/8] gpu: nova-core: build SetRegistry entries dynamically
Date: Wed, 1 Jul 2026 09:26:20 +0300
Message-ID: <20260701062622.3499033-7-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260701062622.3499033-1-zhiw@nvidia.com>
References: <20260701062622.3499033-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|BY5PR12MB4097:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e16f419-4e23-467b-0f89-08ded739ea68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|82310400026|36860700016|376014|1800799024|18002099003|3023799007|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	AH+x/6S74zi2tgdRVo7MbRizPzgAS++rKw6JSdgHUr2RbJbt6IJPGFbm0WuoIVHqizzlTIObpvxVK/zd/HVUWkHu5UNrszsS6FZbhdI4ubZBd9Cy2QPEkEelfUTr0xmEwOrEb4gu2AW2eNZFS6dhsuimyjz9JENFlBJvQnHQygd8E6Sb6kDSRCk2nNnnbjaqJfslGci2vzOg5+LW6MPRcQ4N0Y6D6YgCfmlH7M17NO9lhlt0r8vy0FAgxvlSu4spcM9ad+45OiCGEV13/rfU9manjxArWZSg54XKGfY/5d0MHy7ZSNeQYzEg+ppovLlf/KFg3flSmLDX3Lw/fnmmX5xUvM1opSoS8hcpRJ7oWfoYDQDLXfqTh3PGwyExJ9KX08Wzp+b657EBSrmj3T4c/4ymxv0l5ZjB5Yzaaci9Y9qAilVe1c+9cp79frONGKZVrAAwGBPF4ZbAph0utcssYe1bdlU8xUxrQS9ll0sfw8qPHAGrYwequpFXP+csuVs2zy+Tr5g1PRW4JoaX6p1CbZBRmi22MwbLltLFkIVOrtaCBbawt7qfDCyuhENnL1C74pTt8G0yc3WoiYBJRLsEea8OG+PS6ZUnxDsGhCwZ/UWmLKX8L0gBw39a3oWBT9g7Rg7GeyaUNPHRPNMgxcGhbO4dixyjO/1W0RXaN9gXq28AAn4vroKlfa8Pdc8RJfSm1GUj++7DWZLQcEjU99UPFQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(3023799007)(22082099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GPJT9BjcUU2QrD4snCTkbYxxNuH3oIwjJLNzMZ21L8J+Op2b1hAhp8CxlqZbywjwLT0xyt/o99380TcjFHDDaOFVa0/nUypcVVm/BzUFec2pdy553HJ1mBk4hxNzbABtdbXlWgsnI/9enmpE0KNW2dc4nY+JgE5dhMi6Re4FyjXqnJ3Ps2zVcWu4j+mFPyDQoUGHM99JamyHn8SIy7hesd48QlhAXWu5YZp2r6CLHJxXxpmTyaYRfAqGQ/nozxpnEgnzFTIBzadWEwlR4gS/V/B5z5ghO/SK3S+fIeKBt1IESkJWHReHl39O26eoebSaZGsqOOsWSJKjO9CRqHw1c0Mv37zHv/i76ngIUUUeHf11cKBQ7O00UrCEUHTwFn352LoPMPMB0Mf4+RsWUj+f9qY5KwP/2jcQPo3Gz4835Tdw7K2qLZaNgcNOYCDITgqa
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 06:28:07.5926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e16f419-4e23-467b-0f89-08ded739ea68
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4097

The GSP SetRegistry command currently stores its registry entries in a
fixed-size array. That makes every additional runtime-dependent registry
object require reshaping the command data structure at the same time as the
feature that needs the new entry.

Keep the existing registry contents unchanged, but store them in a KVec so
SetRegistry can be constructed dynamically. The constructor now returns a
Result to propagate allocation failures while the command payload layout is
still computed from the final entry list.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs     |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs | 74 ++++++++++++++++-----------
 2 files changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 5abab54639a4..139cedacffd2 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -102,7 +102,7 @@ pub(crate) fn boot(
         self.cmdq
             .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq
-            .send_command_no_wait(bar, commands::SetRegistry::new())?;
+            .send_command_no_wait(bar, commands::SetRegistry::new()?)?;
 
         hal.post_boot(&self, ctx, &gsp_fw)?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 86a3747cd31c..dfb9f04e284d 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -67,37 +67,46 @@ struct RegistryEntry {
 
 /// The `SetRegistry` command.
 pub(crate) struct SetRegistry {
-    entries: [RegistryEntry; Self::NUM_ENTRIES],
+    entries: KVec<RegistryEntry>,
 }
 
 impl SetRegistry {
     // For now we hard-code the registry entries. Future work will allow others to
     // be added as module parameters.
-    const NUM_ENTRIES: usize = 3;
-
     /// Creates a new `SetRegistry` command, using a set of hardcoded entries.
-    pub(crate) fn new() -> Self {
-        Self {
-            entries: [
-                // RMSecBusResetEnable - enables PCI secondary bus reset
-                RegistryEntry {
-                    key: "RMSecBusResetEnable",
-                    value: 1,
-                },
-                // RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration registers on
-                // any PCI reset.
-                RegistryEntry {
-                    key: "RMForcePcieConfigSave",
-                    value: 1,
-                },
-                // RMDevidCheckIgnore - allows GSP-RM to boot even if the PCI dev ID is not found
-                // in the internal product name database.
-                RegistryEntry {
-                    key: "RMDevidCheckIgnore",
-                    value: 1,
-                },
-            ],
-        }
+    pub(crate) fn new() -> Result<Self> {
+        let mut entries = KVec::new();
+
+        // RMSecBusResetEnable - enables PCI secondary bus reset
+        entries.push(
+            RegistryEntry {
+                key: "RMSecBusResetEnable",
+                value: 1,
+            },
+            GFP_KERNEL,
+        )?;
+
+        // RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration registers on
+        // any PCI reset.
+        entries.push(
+            RegistryEntry {
+                key: "RMForcePcieConfigSave",
+                value: 1,
+            },
+            GFP_KERNEL,
+        )?;
+
+        // RMDevidCheckIgnore - allows GSP-RM to boot even if the PCI dev ID is not found
+        // in the internal product name database.
+        entries.push(
+            RegistryEntry {
+                key: "RMDevidCheckIgnore",
+                value: 1,
+            },
+            GFP_KERNEL,
+        )?;
+
+        Ok(Self { entries })
     }
 }
 
@@ -108,15 +117,18 @@ impl CommandToGsp for SetRegistry {
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init(Self::NUM_ENTRIES as u32, self.variable_payload_len() as u32)
+        Self::Command::init(
+            self.entries.len() as u32,
+            self.variable_payload_len() as u32,
+        )
     }
 
     fn variable_payload_len(&self) -> usize {
         let mut key_size = 0;
-        for i in 0..Self::NUM_ENTRIES {
-            key_size += self.entries[i].key.len() + 1; // +1 for NULL terminator
+        for entry in self.entries.iter() {
+            key_size += entry.key.len() + 1; // +1 for NULL terminator
         }
-        Self::NUM_ENTRIES * size_of::<fw::commands::PackedRegistryEntry>() + key_size
+        self.entries.len() * size_of::<fw::commands::PackedRegistryEntry>() + key_size
     }
 
     fn init_variable_payload(
@@ -124,12 +136,12 @@ fn init_variable_payload(
         dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
     ) -> Result {
         let string_data_start_offset = size_of::<Self::Command>()
-            + Self::NUM_ENTRIES * size_of::<fw::commands::PackedRegistryEntry>();
+            + self.entries.len() * size_of::<fw::commands::PackedRegistryEntry>();
 
         // Array for string data.
         let mut string_data = KVec::new();
 
-        for entry in self.entries.iter().take(Self::NUM_ENTRIES) {
+        for entry in self.entries.iter() {
             dst.write_all(
                 fw::commands::PackedRegistryEntry::new(
                     (string_data_start_offset + string_data.len()) as u32,
-- 
2.51.0

