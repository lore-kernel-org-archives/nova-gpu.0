Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB083BFE33
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 02:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697598; cv=fail; b=PYj1/Sl+yGLh0NZ8fd4c15LL6LPudvjt30WbvxofqUkhgWPDV0jvY8/cX4UTWbHp5y/2PbZPig8rKI4wcCZjG6dzzYFK4wp9v/lhvCCiUd2ztEHJWaE80fMhN4Cwr0R8hCUp50oXttQUlA5vLudmaaAAnlALXPKHIH3sUK5Ss/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697598; c=relaxed/simple;
	bh=z2+U6NHjM8RFwda6rnRLJ/be1pvxhmjQYa3nF/xrdpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e4l4BR8BQZ+vhGwW2lTqFU3/gkDHtgaURh3W0JIh2dyg8xRgGYolumeWS36CIR4OpRhJRqf2wvYEQH7upgbnoTdxo7r2K/uWKM0qCaCimA91/n9uneHe4SkRM02hsnDyhBE59PUBgmKyPisbAF3mM7n9RQse8izOc/o6MhsVKhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pOfrIlaV; arc=fail smtp.client-ip=52.101.53.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pOfrIlaV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4JXcMp+aT3Az22fFCEt0oWTyuKGD4+CR5zPd3QMXE1GSSWhNxEhws1aKSw35jBweQGg027K4bpefC/oIoX7bRHzVBHVCA2uXBMZZUFrQwiGI58L8HuE8zPfVQ2XahP7usoUR2ZwvT08OzmsOoFVc4LcOwE+/1R9jH+WWSAzrwZ4He6RR4FYUThJdeVoIcjdLWLKl0tf1n9x9XqcLdrOIxspZnJoZSNcvdNw8CQ+11JyCIu20PDr3VBKwpWXFU5h874pQWWCi5y9Qw5xeE3dl8aTe+Uz06vI4oGuemB7+miATYua3Hd2UxyySvpr1BQoqb9uaFLzvckwjCDpp0a8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kpt5mHgl1bVQ7vFeacxpEefUXfv8upwSiHghGsos1ro=;
 b=sphnvpHqi7uH619H8sGupZAUBQwqFPpQv/IFq+JiBQlhftMithcYZGg7PPfETO4/3K4LGAHpRMdmzRcwVs0WBNRXxi5erx3Br5XF3kGvdNYuWTrimMEtF8SbTodmod0iUlgU6g7GDwboAipu4UFGBLRUWpuI6FTYCTF8Tp8jXz78iQpjNH4kuTBp9I212hOHAOX3JDIhtnfhTCynLF4f3CRe/Ma7HYzEWSUfk9ErH+v+pQjkpYVa6VOUIPWynn+TpUbxm0M67m9wTNLW/zL8oFZamr8z3kucd8+8OUUBArEQbwG9j62fnHsyZ4UBKtEFd/Hqlujvegf738Gz/K+CUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpt5mHgl1bVQ7vFeacxpEefUXfv8upwSiHghGsos1ro=;
 b=pOfrIlaVOiDIEhHExIHhLDdL4DXmZd5IPWEo1tehOWj4f6rCs4T3ZqkDibZzK5a7rAVZ97p6EVuAnKNWsSbeKq9iQya4Nc5b1DoVjwGWYjwM/jlgooAPcIcooBAJMx+vL2zNCnCOXu0oYKIrOl+d2YvWr2iMpKD6GXhPPsoqsl1Ba5CUOuEaHdgsGKpRbKZzYU/dP/g/62F+G31FOJsdkDauhY90cqLF5EHd7ZspipGy8RhMD0aW3OMwwSm4uPcwO56/ymE6OFoVme5wqkmLLQ++EDQU2mCja5m23ZuhOL6seTqbjOOogPvb8nP2xura26eArGFdMVVStA8pBkx0iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8015.namprd12.prod.outlook.com (2603:10b6:510:26a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.12; Fri, 18 Sep 2026 02:13:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 02:13:07 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 3/4] gpu: nova-core: gsp: print GMC command names in debug logs
Date: Thu, 17 Sep 2026 19:12:48 -0700
Message-ID: <20260918021249.1187837-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918021249.1187837-1-jhubbard@nvidia.com>
References: <20260918021249.1187837-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0123.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: cede1ec1-8f6a-4dab-e327-08df152a60fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|366016|376014|10067099003|3023799007|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ozyh2d9pnIxmVUred2XZD+3j4q7ix+Xngk1+jVzPu+viXaqCQgxIUysxHAR0kgRaHI+rVvlSbd/A4H0IHpuOuSnBrTnAN+K6uVnHtbFnnZqduv0hFUiS3QfzaR5n62WY+rz4c6GPiPddTRbMkpr3u999eSycT87oViMay7JkctqG4yatk+Kf+Rp141ZCIH3DJK8rkjdFeSPobVKZylpCoi9CNtNnKUdIHdkAHa6u65kouyGmewhBD4OXf2FELKy4vOowY++4t4h9zCthHGyAc8WmL68PeJOcR1sTKBJRVHPI1srvb4kBuX3fyfvcZ3UJFoZGYnLCsNe50EzGqMjg+9GO2SXXzTV2ZJt0aKGFo7hfb1bnijAfAs63qScgCuXErAIsOy8S0K8SegzJz4alyBP2flx4R3UjHfjomOppXa5S/9OtrmkFE7dSZpGSU1QYp3H0oVagBsf5oFRL44latja/vEhXqMwNdqL0qTvGNQr17jdoGsZIcIRbjmNn2srE7PCpSLmtp7OVVKauXEMqV5ohMWUxhzTeJJidQSbTrrvOyfwkrRYdlrRUuuvQd5lJT0Rgkogpi+/GFBUAHrYoA5xAb7vckrnQPk12ePXUEuuiyTiJd8uJY1GJMpAWdcgmu0/n482sOUKqeyADRcLt/MlTwTMC3UuBcT3qhgu54Qo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(366016)(376014)(10067099003)(3023799007)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0QpBoZEMaDsapcbXlayHEG532D9kd2oBicC2lH8nmHCgvK589d17goHB/M8Y?=
 =?us-ascii?Q?bbA/7UjvPTODRsrp+mYDZwW6WfuJPoZI1G+AzRcn1vKvzrXjJHudBkgyaHXM?=
 =?us-ascii?Q?C5DA0wRMcr3kZT7B8lzAh9jG3a2xh1VMH3KpAUiRu+G6ZTp9jv9bDqQDLzw/?=
 =?us-ascii?Q?vj8A5zQow5WQu5ITB+2aayk0B027x82lMsIuEc6vgxFiErXVVlIu+4Ggl+3F?=
 =?us-ascii?Q?JI7r0eURNejHDrkgYnRVvYt7NH1yKLC1Lq3iFnM1A0Jcpv5DisETaJfn0yl2?=
 =?us-ascii?Q?WpxLlhcQ1G1ihUsxmuMEfJFPJ5TireYBSvWmL21akIzbIH2mdXsS2OktT+W4?=
 =?us-ascii?Q?6nyyc2FjvE/FS49Uf7KGHbtGWPg0lH3B6PBL1Nb7l9HBgDP57g3bjOdLAUI2?=
 =?us-ascii?Q?dW6XTQmVn/8C6D6bG4Vy/N2Wev5Ks+EF7TlX8/DyBAtg7o7tvkXpHSNSf0KV?=
 =?us-ascii?Q?u6bAxqg9CDtU1+m/I0IvYam6HmjucbSjqICnumQ0HXxm95hrkuuo3qVGRMyN?=
 =?us-ascii?Q?rzya40f1L1apLKzGXx4lhzA+rcc/a08TFwE8etAhSG7UgoyRLF0AuX6Mv+XV?=
 =?us-ascii?Q?stzShxgADI1BDFbAoP3EDVH3GGUr1l/8ys1LUv7HSEMQwKGBSS7HzbP4/XvC?=
 =?us-ascii?Q?06xAiT1T8mtFwZpJqYaWNpR+CaB1//5QUsQwpoVRvLuWycq2dr0gonYBTFH9?=
 =?us-ascii?Q?+VbxOPkY+CKB4ZD22V0A+ovQOKaHf59ujtdKrUHqnX6s3qsd0HLRZp3pIpaZ?=
 =?us-ascii?Q?Cih4whQh6AfDahMeVglNYbFGSNAl5XvlPwTMLrweKr5EzB2VYNVDJiuPKhjv?=
 =?us-ascii?Q?8GGws7Ehu4pe9WE0WgehkHRAyaqI1Ipf0TH/8MmBVHC04kQbVZ7y58hG+1vN?=
 =?us-ascii?Q?iZweYp+/gmHEyQbKcOpIyt8X4gVz0U7tvTUMmO2udZJJDEtmXdH7rO5NfTgq?=
 =?us-ascii?Q?QzlLgWYKin1m3NiefwkuDqeW8qlCU4rlfu1nS/fNMgBZBVEAbNFocNI8vIfk?=
 =?us-ascii?Q?o9GFo4VHOvkxbRjbB7ymsfGx04ew+XpMzBb+WJI7SzqiV3Up3oh6Djy6WPGf?=
 =?us-ascii?Q?8xSGddlJ2uHmbqr6VMfs1Fh7iKMQENZCbpP2YwPQBqqrTdYPY3LnN1QA8dOY?=
 =?us-ascii?Q?RWpYqmJYzVQyngPzAQTQBowKTkzCIJ9cqKXKvxbKBqzP2/Qbtc3c/Z5rvijX?=
 =?us-ascii?Q?RBjWWizCUHipNxJmZfggnYuRSjx1VKOnQJA9ypSYoqmxAlTJpMbd//3e1MHy?=
 =?us-ascii?Q?lnfg0SAVFZZ7wGJSKXU5FomZ9A6jlSJlRHHc5ar1IIhgZFSEqRk8U97mG0R6?=
 =?us-ascii?Q?M+JQh7OmiDlu1FkOH4LH42Y6vL2SJdWAe8gTxaxyEXXagSRmNRU6QSyyZL2U?=
 =?us-ascii?Q?pA9Rp0FhilqpbK86hAo1v70GlmbJ0bOHq7rvQKaJrhAPT1f9A97THYKq66aI?=
 =?us-ascii?Q?uGM574xZrOlMgkMrZzNI6xRYbS2l3WieqSIR4BO8UYsgFetGryVucXzpCexK?=
 =?us-ascii?Q?HqtT1CWFX4I6/xiT16LrtLm6LVqDc3mzf2Zbm2mSKWP8g96+2kAJYpO2Kwe9?=
 =?us-ascii?Q?hwAwYek68vQzxCeq1EqfpQawrFmd0mTxF7ucr0VNuK6uFQpCHLXXM4SqvtNt?=
 =?us-ascii?Q?X2DFE4mRriYnolOB6Ge4LaQErp9TSBSih36PPIfuhs41n6FeGJFVOBOm3S+G?=
 =?us-ascii?Q?N0tbQ5MeWuwj6oZfWVg7ro0AelpP97oxIMZNB2LwkcnCn2lk2t5NKQ0GC4sz?=
 =?us-ascii?Q?0Bk+OkNz3Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cede1ec1-8f6a-4dab-e327-08df152a60fb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 02:13:07.1665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jx0Z2RZQ2eyPXxlm+PRKn+UWEKlErwTP+pvxDOeI5pn9YIzFyOq1L+fyd2HR7350LoUNc9yuAcnJ382yIti2cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8015

The GMC (GPU Management Controller) API names each command in the
GMCAPI_COMMANDS enum of the firmware bindings, and a message carries
the enum's numeric id.

The GMC send, receive and error lines printed the bare id, so a reader
had to look 0x10001 up in the bindings to learn that it was GSP_INIT:

    GSP GMC: send: seq# 0, command_id=0x10001, length=0xf8

Print the name beside the id, from a type that wraps an id for
formatting, so that the ids stay plain integers at the send and receive
interfaces:

    GSP GMC: send: seq# 0, command=GSP_INIT (0x10001), length=0xf8

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs |  9 ++--
 drivers/gpu/nova-core/gsp/cmdq.rs | 13 +++---
 drivers/gpu/nova-core/gsp/fw.rs   | 70 +++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 6f8f330a0297..8848feebb9db 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -42,6 +42,7 @@
         cmdq::Cmdq,
         commands,
         fw::{
+            GmcCommand,
             GspArgumentsPadded,
             GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER,
             GMCAPI_CMD_EXEC_HS_BINARY, //
@@ -169,8 +170,8 @@ fn dispatch_gmc_boot_event(
             _ => {
                 dev_err!(
                     self.dev,
-                    "Unexpected GMC boot event: command_id={:#010x}\n",
-                    command_id
+                    "Unexpected GMC boot event: command={}\n",
+                    GmcCommand(command_id)
                 );
                 return Err(EINVAL);
             }
@@ -179,8 +180,8 @@ fn dispatch_gmc_boot_event(
         handled.and_then(|()| self.core_resume()).inspect_err(|e| {
             dev_err!(
                 self.dev,
-                "GMC boot event {:#010x} failed: {:?}\n",
-                command_id,
+                "GMC boot event {} failed: {:?}\n",
+                GmcCommand(command_id),
                 e
             );
         })
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index dd0b3dfc6f37..2b53b1e6cebf 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -52,6 +52,7 @@
     driver::Bar0,
     gsp::{
         fw::{
+            GmcCommand,
             GspGmcMsgElement,
             GspMsgElement,
             MsgFunction,
@@ -884,9 +885,9 @@ fn send_gmc(&mut self, command_id: u32, payload: &[u8], max_response_size: u32)
 
         dev_dbg!(
             &self.dev,
-            "GSP GMC: send: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
+            "GSP GMC: send: seq# {}, command={}, length=0x{:x}\n",
             rpc_seq,
-            command_id,
+            GmcCommand(command_id),
             dst.header.length(),
         );
 
@@ -1063,9 +1064,9 @@ fn log_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
     fn log_gmc_event(&self, header: &GspGmcMsgElement) {
         dev_warn!(
             &self.dev,
-            "GSP GMC: dropping unclaimed message (seq {}, command_id=0x{:x})\n",
+            "GSP GMC: dropping unclaimed message (seq {}, command={})\n",
             header.gmc.sequence,
-            header.gmc.command_id(),
+            GmcCommand(header.gmc.command_id()),
         );
     }
 
@@ -1269,9 +1270,9 @@ fn consume_element<R>(
             ),
             QueueElement::Gmc(message) => dev_dbg!(
                 &self.dev,
-                "GSP GMC: receive: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
+                "GSP GMC: receive: seq# {}, command={}, length=0x{:x}\n",
                 message.header.gmc.sequence,
-                message.header.gmc.command_id(),
+                GmcCommand(message.header.gmc.command_id()),
                 message.header.length(),
             ),
         }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f7e83e75e53e..106d71f95fc3 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -12,6 +12,7 @@
 use kernel::{
     bitfield,
     dma::Coherent,
+    fmt,
     io::io_write,
     prelude::*,
     ptr::{
@@ -802,6 +803,75 @@ unsafe impl AsBytes for GmcApiHeader {}
 // SAFETY: All fields are integer types for which all bit patterns are valid.
 unsafe impl FromBytes for GmcApiHeader {}
 
+/// A GMC command id that formats with its name.
+///
+/// [`fmt::Display`] writes the name that the bindings give the id, then the id itself, as in
+/// `GSP_INIT (0x10001)`. An id that the bindings do not name writes `UNKNOWN`.
+#[derive(Copy, Clone)]
+pub(crate) struct GmcCommand(pub(crate) u32);
+
+impl GmcCommand {
+    /// Returns the name of the id in the `GMCAPI_COMMANDS` enum of the bindings.
+    fn name(self) -> &'static str {
+        match self.0 {
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT => "GSP_INIT",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER => {
+                "EXEC_GENERIC_BOOTLOADER"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY => "EXEC_HS_BINARY",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_SUSPEND => "GSP_SUSPEND",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_RESUME_DONE => "GSP_RESUME_DONE",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_ADD_VGPU_TYPE => "ADD_VGPU_TYPE",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_SUPPORTED_VGPU_TYPES => {
+                "QUERY_SUPPORTED_VGPU_TYPES"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_CREATABLE_VGPU_TYPES => {
+                "QUERY_CREATABLE_VGPU_TYPES"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_ASSIGN_VGPU_TYPE => "ASSIGN_VGPU_TYPE",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_DEASSIGN_VGPU_TYPE => "DEASSIGN_VGPU_TYPE",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES => "QUERY_VGPU_PROPERTIES",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE => {
+                "QUERY_ASSIGNED_VF_VGPU_TYPE"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK => {
+                "BOOTLOAD_GSP_VGPU_PLUGIN_TASK"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK => {
+                "SHUTDOWN_GSP_VGPU_PLUGIN_TASK"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE => {
+                "SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES => {
+                "CLEANUP_GSP_VGPU_PLUGIN_RESOURCES"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_PLUGIN_TRIGGERED_EVENT => {
+                "VGPU_PLUGIN_TRIGGERED_EVENT"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB => {
+                "VGPU_MGR_SCRUB_GUEST_FB"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS => {
+                "VGPU_MGR_ALLOC_GSP_CEUTILS"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS => {
+                "VGPU_MGR_FREE_GSP_CEUTILS"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SCHED_CONTROL => "SCHED_CONTROL",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_MMU_FAULT_QUEUED => "MMU_FAULT_QUEUED",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_INVALID => "INVALID",
+            _ => "UNKNOWN",
+        }
+    }
+}
+
+impl fmt::Display for GmcCommand {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(f, "{} (0x{:x})", self.name(), self.0)
+    }
+}
+
 /// The headers that open a GMC API queue element: the queue element header and the GMC API
 /// header.
 #[repr(C)]
-- 
2.55.0

