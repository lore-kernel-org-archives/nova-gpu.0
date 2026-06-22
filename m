Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012051.outbound.protection.outlook.com [52.101.53.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A13133B6CC
	for <nova-gpu@lists.linux.dev>; Mon, 22 Jun 2026 19:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157552; cv=fail; b=fUhyOxHu+dvktzJfwy/jll+ABhfc7ccakMbrdueiNRJ55G0cAtukOHkSY2xSciULKI/K8xSZ/M6OVNEV3aup9lRRTXGbJMcpqLVceUrHfz6O3FINGsz48i0n2OnWhK2zTQAjtxmR+99A8uya1zQQdh66C3iUVhay3dpYRcKTNjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157552; c=relaxed/simple;
	bh=1uwk8MeDSTk0CgL1v1mlG4ctKh4+YlhwJW6jww6SyAU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pUyO9m/ghqaTtvnsXsDwMDtylT1AsIcG4mgup38DWNNmihWv5sBU3qwxM8xBzmXjmlT392v7LhiZCssA0tqfhnRUeJPVoGIoabDWfaLC0aCa7HC8hclInLwD5Z228GkrRekbmVeSYxZPtjPi3Q82UYyIb6+0VFINdDou/X+TicI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jYs0htJ9; arc=fail smtp.client-ip=52.101.53.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jYs0htJ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3QmgFdSPtOARTuGeqqwg4wnLYlgANe8PCJi8uF+Q6/vOXLw//G1wHq3TVpKTOe6uAIpGVuZBcnRLRfoBL9LiC1b2F62b/zGjywUy/oM5JxGA9h6rnpDsojz5JXFe/jCgNZCUvGDm1LQenFdLkvT8ruoTX1E+WSvrCxkMImsf9R3H9mlyS0plZBiCOZx8puxKxH0BXO9HEJFpTBDyiXjgD+icj2FVu9b11BggLvtdmwUKkzIGzq+iDBzORZRctZ6DUaEjhe+SFYGldtJ4YR2mDvM0Cld7wzMqXuLdf/t0zv650wLRITwtg/Pa/63jY0Qu+7LttTNJN0hjqvGjFf+EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZb+AqxL6Qp4mJ3DtCoIw2gBQYV21WOBHEKIb8BMMVg=;
 b=hMWR2HXZcgHbtlmKpRKyvojiMauHCgeT4lqJ4mTvVTIwyv75iSwrWh83tJFiQUI34i891hnIs+ENT1sI9ffoBTw7Rm2wQuZnGAnEq4jJbswbxL1ViWAcZMy3TFMFMWVoLZt1+i297bFCOOM0ID3ZNulINt57TYJFWCw/UmMHgIegGCag/6FYQo8uhz12ZBY+SofYdvfWbH33JiLhhxubTi3kn/Q+7zHjNYTmo7Cxq8PkQBedb9CQvVR1URMP7MeIsNYIzNz/CiZTmqb+JiJvm+Oc6BK7gvIAjF4dVsgqxWpLDHhPNhTJ1BxS4VVkbATllG9H/lUX8Ta6xI2bBUEufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZb+AqxL6Qp4mJ3DtCoIw2gBQYV21WOBHEKIb8BMMVg=;
 b=jYs0htJ9s6SeOxEBgy5kvG+Ez7BZ6VVu5qoafSc9N9iifKexHu0dirgQMOh31NYPLx6/x9cd7X61PPXTmirgohAk+KHBl65qPV+D7oI+d6OVht/H0FljzZCQuiI2KFpYB3KHqdGtB4IcJqLRR0UfiOisdA8iPEFdUDeTcWmTB9GwEZkLv8xuTgNfx5Lybu1OZkoAbvQ61cxCOS1iVoW4J19s9+ItZScAaftlC5VI0C+Jqoc/UyR0eAMYlsuD7sCUtX6gIcmysaaiGiBNTLRy+73CL+/CeTesk710CxLgHGr4gDIrlhvypTdcDAE+rzsi8dnwncNOEHL3fWleRPMQhA==
Received: from MN2PR14CA0012.namprd14.prod.outlook.com (2603:10b6:208:23e::17)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 19:45:40 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::99) by MN2PR14CA0012.outlook.office365.com
 (2603:10b6:208:23e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Mon,
 22 Jun 2026 19:45:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 19:45:39 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 12:45:16 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Jun
 2026 12:45:15 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Mon, 22
 Jun 2026 12:45:07 -0700
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
Subject: [PATCH v2 5/7] gpu: nova-core: build SetRegistry entries dynamically
Date: Mon, 22 Jun 2026 22:43:51 +0300
Message-ID: <20260622194353.1308872-6-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260622194353.1308872-1-zhiw@nvidia.com>
References: <20260622194353.1308872-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|DM4PR12MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 4244e416-82a6-47e6-e1b5-08ded096d6cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|23010399003|6133799003|22082099003|18002099003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	l0SC74pYf3ijA0pQf4CHr2c2oFviufhIChSCeeqJJxMNJRSeMg/KXgvlOFR73pYqwP2y0ADTrFqSUZeNoZvnA+qu65EYLlYLP4fMHuEv0yeb9XVrQNiJxgqMiDj1OqpxnAZpYgoUaqO58OH/6RpEHy3N/Tmub7EXo5V1+2WVrXXDs8oN78vjWdvYJ1iiSlB1O8bpnw/F+oZSSWfPaxsY0o3SrawbZdm+zWKkpJTqOig/6CY96bQYY1P6k0dDBoFR0nL28YvQ+rAPlD4uV1cpeGixuY02TZls9z2X0WoF35T0vDI9z2wRoEd2O10TM0HozR6dvE65ygm7rbRxzs2g1vz+NQUKd0nG3XF/B7O8sR5uDVxrUdZUrW9kh5+7E3j7A4f12rKuPotvHx/Ji+63q1K+VbzNCsyhEDTuJ2pxkYSQAyW5323JWzqy7HJailUhOHIsSacQrbVUnrIdvCFLUNzDg22X5vZnzrtxyiqShQ5vDHxu32HZS4bPWN5xpzb6FR3JbMovZq5la0O/4/QMP1vYMlkpNdXlJUzXWKJlTHjMqI6+vKZTV6nUfFFJoBN8fvkMlGeds2zIJy3CKc71e5gGcL4ZrkKgBCSXrvygfSl2If3j82BfwKdxEdI8YwbwcN06cD2QoKMFmBETeEdYEjVqVzKBU9zt6Fh+92TbsxMQQgoHKAsh38qrRMMfPKOwHvEqGlOb4wVM/rGGoYfRvQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	frrAf8vlIo0kzmWR31pFTwEbffrVvRaFaeFJ8yIjRjMcj2RYi+h/64r/sRJWNq8+Wt0sfqkO4xB146QTXWd1j0WrB/ugnLEiz0Bx/VjAAVBb8SzGz7cI4jkzm73kRErjpHybLGoh862Q1ZjTfG+KpWnJU4GzcqrTqNh4y8fiFfBW6IVPCKX1hJjfhPI+jjX7455msCc239fc5MlPT7XggRR21tsnYYzTPY5IAUpNhe+u1JTYIISGgHeCbx9U/PKSLkTsec9PCu7Bfwy+6kQt2+N6khh9i0SG5VR2GokohZhiVkAIZslrJkkNnvfL8AR4FxtkF27m9Cqz2x86jjjI21pPkXfA7GjOiTb4CBAyK9XidYy2NoXgVGyUJ3wUaYGbjxwktXdXh2LfoXK6sUPo43ssJAR54feKCkRGYDzlkUQM5GtDX0toYuPiXqktfUE0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:45:39.8812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4244e416-82a6-47e6-e1b5-08ded096d6cc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961

Convert SetRegistry to store registry entries in a KVec instead of a
fixed-size array. This keeps the existing registry contents unchanged
while making the command ready for entries that are appended based on
runtime state.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs     |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs | 73 +++++++++++++++------------
 2 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 0a33cf4dd975..55ea8e38aa79 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -94,7 +94,7 @@ pub(crate) fn boot(
             self.cmdq
                 .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
             self.cmdq
-                .send_command_no_wait(bar, commands::SetRegistry::new())?;
+                .send_command_no_wait(bar, commands::SetRegistry::new()?)?;
 
             hal.post_boot(&self, &mut ctx, &gsp_fw)?;
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index f84de9f4f045..3dccb012a37e 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -66,37 +66,44 @@ struct RegistryEntry {
 
 /// The `SetRegistry` command.
 pub(crate) struct SetRegistry {
-    entries: [RegistryEntry; Self::NUM_ENTRIES],
+    entries: KVec<RegistryEntry>,
 }
 
 impl SetRegistry {
-    // For now we hard-code the registry entries. Future work will allow others to
-    // be added as module parameters.
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
+        // RMSecBusResetEnable - enables PCI secondary bus reset.
+        entries.push(
+            RegistryEntry {
+                key: "RMSecBusResetEnable",
+                value: 1,
+            },
+            GFP_KERNEL,
+        )?;
+
+        // RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration registers on any PCI
+        // reset.
+        entries.push(
+            RegistryEntry {
+                key: "RMForcePcieConfigSave",
+                value: 1,
+            },
+            GFP_KERNEL,
+        )?;
+
+        // RMDevidCheckIgnore - allows GSP-RM to boot even if the PCI dev ID is not found in the
+        // internal product name database.
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
 
@@ -107,15 +114,15 @@ impl CommandToGsp for SetRegistry {
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init(Self::NUM_ENTRIES as u32, self.variable_payload_len() as u32)
+        Self::Command::init(self.entries.len() as u32, self.variable_payload_len() as u32)
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
@@ -123,12 +130,12 @@ fn init_variable_payload(
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

