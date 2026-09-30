Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4035390CA3
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739801; cv=fail; b=utdUE4pOWWsQQg1XWf1ZtHK0cTFI+ip3j38tJI2bbtuqh5vHq2i3vRrq8QHjdKjAX2uyV9ia+qoDMJtOnfJF0L9oWE76LztoDKD64wksB4JNPdYBrcMKLj1fAwrfnuCawKjVWwuL0q5bjpWlc/CVsilygAgIT2aoz83rwrEoRBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739801; c=relaxed/simple;
	bh=s/0ir5YCC5445AekmDKR7H/2GdsTRWKEzn7cck/3l3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gvZdd6+xAuideEcuAZ0LDkFkZaG2JUcmn2Yxv5bNqpjc32rR6/yZaSsFjCI2A0xUg0XJnDkMjH9xDFZxk5RPv/QfaAKspjNiSpX5eKDMliyuwR2Krmo5tw2O7DBbMOYm4dWsR3W/wV2XDTAYBcpjls72uvX5VZWuRI8d8sNW6vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wnw/3SBn; arc=fail smtp.client-ip=40.93.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wnw/3SBn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVzOi1BKm2CQeMoYrT6fJy5964ozljOtCPbCPibawuv8hlhvUMq1CqlW2hRbdWhZoqyX37XyMlBCemA6E3wqyo9wiv9CeOSD4HlNEpgSM0aV/RTaZqxmOcp74zTp6oaxGFR/9JTKNLjFNeuqZGYdoO7ILFuPIcr5hKCJ48L/XtX+8qyBkgeGGaf1vW7rADTqh/zbKGUY2Ne2k4ArZCYinfdWOFSlK2RBaWNBdVCYbCgzdIfemUI92iA7rbzpkGNWl+mvYGgG+6IPH5C87B30+I6biSDF3DCa93+62Jle+M3SQYNVyPGNCgRIf4J2qwM3XGckAj7xtN3ZSssYnBRvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdm8xPtbHBIfDQSbbb3uBhqdGZ8cYBEgozG1rALy5no=;
 b=Cy4ofpdY6qyc2jWJ4bVDbahPeBVuWC/qYYALOaz6pEPqkVNUZG9SU5wm2qkzs77oN/qYTfVEE/o0ffRC22iFwz4rzOX2c3FhNTaBfM35wgBhNw/YKmKVOX+ivfkYXDyIzqdXE4g+uPy2+NfPOADmMf6P928Pj5gsmmw5LjyuWdJw9xUg+/A7Scd+ssuc5diIrPTCWwqVX00KN2RqSN+9+jKLm1vv9DCgDZi6N7Tch/JysmKLWGXSWVG7NiwuX7QIvLGsR7O/G1VgbwKN9Kmx4SmRQJRVlhEnRuNPg0RU8NJPXVMBBF8Kf5KUdB/ozL0gXbjOHhaNjz9npNTSs2yHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdm8xPtbHBIfDQSbbb3uBhqdGZ8cYBEgozG1rALy5no=;
 b=Wnw/3SBny1CXr3YvQATc1fbQpg7keWbIotlD1H+kdhFDHu02a+khWw6PGZeFL1LXM2cypOJIEHC8Pc8KBZCv/zNqFH0x6SGQiZoJ5Nbw0GJXgBnnu9q5buteQtd/Y3VuwkW9AUCeTLao2LvbdOezTSU9HGBw4O8c3UpEDqzaOyFQkvCgvOmmhU28rBhKZITx1TMu5QQh6FN3aiYm3+Em+2RdZig2CSE4NORlA+kT+P+sORHrMbGEQd6NwezZ9uA4v9J82NjH8HnwP9cntKZcXy8r/SrbdS5VW2A/imso++L3Ct2oA555TWW3L+pgB01fM+pEMlQmmsQIPaw4p1j2tA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:25 +0000
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
Subject: [PATCH v5 12/15] gpu: nova-core: add the falcon interrupt registers and HAL methods
Date: Tue, 29 Sep 2026 20:41:45 -0700
Message-ID: <20260930034148.590687-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: bf752726-538c-42d6-b2c0-08df1ea4d7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|5023799004|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5/ijn0QO0ebk4kImspB09dYbB+OvBBOTFp1CO85RaguNlB7u1lX6uVeqYMKvhx1BtMJ5sNUQiIsQb3wXeST9RytY9Zrf5+QMzjd/yo6aMxBw7KM43ydLw4NdVcMJwPA7QIH/H7WhlK7M/Q5jIC2LVksa50SwXnaCtJeZBIKq9n4r5pvgHwDwgKhB4lqrbIgTKk5GwAXNPQ+s05IjaMNRFjfcvhtt0GZb+dvCQwGvzjA2Mi+q8qoEfZzD14MnZGwpKuNskoxWx/ec6AzGI9HysY/HlTI93/3G5zV/SomOY69TAiCPXArAEwqwKqJbSWJvBTYDbcVzB0p8yHFq6KEoNXukz1GOWCdUQTjfuJJDjkm9nLCcpwqgwHosMlfWTZUc73BUkzf407Ze1U+woJGpoyvfxav2ra6UnPL+hYbI8TxRYXRacv7TWWmIcvpAGzmkJicTO2SPcM2Q8trYKjWY0TM0AWdz35bv7tVJQW5qHwJONbLGJMrfLew5wGHvk5TUEtu8Y0U18ZGh6iG5466+hDVVfRycFs8pX3eHI8344sTqXF5Dh/PZ4b/GeFRXVVxlM76NBu9oMbji1M8VEQ6w9lnrYosjiENC8Fo5oPbiQVL41MLLRqownzeRpUFKZvAky1cHXv2yfFHqkr4eLh5UsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1CRQtP5qG9httochWdn+KypqKFSC18XrOMIJtTHptfgpaAYxgS3uiaQ/D/de?=
 =?us-ascii?Q?lDAg6zSDKxjlyyn52ok2h1Gg1X4ZOY1bVMXOe77N2vIlzrRsbo58ESb29vbP?=
 =?us-ascii?Q?goTfq+RKhpp9SXpdjJaSnfwkgPm6c6Xo74spGLsn8JK6JqaAaTGAKqpw+Lih?=
 =?us-ascii?Q?MUJR2TP1cjxDtVxl24R6eulYeAHYrcPz9mimo1JMCCXTAT/oJUqKPCD0M2Ux?=
 =?us-ascii?Q?k6e6x8MahiIzjGxF8p4CjfYNf/WhaaLwRmBwWnl+RNxviR510hR6VN4jEpBj?=
 =?us-ascii?Q?i+RvTWhWvW2Dkt/QUOobuQQlxXonfCNYyvT/TVs3BZUMPwoij8x28lagr/eE?=
 =?us-ascii?Q?h1qQCeqSI6ea8m0TFks/piJS0l2W8xMNjDEvsl7dDASbrB9ai+gBqC3oi0KP?=
 =?us-ascii?Q?CLQSIpdes8l6gK9IsMufLQxQMU9NDMXDWRI4l/U+Fzq4NLoRseXMH9vfpYPA?=
 =?us-ascii?Q?8yTJH+oWu2WgM/pxtdz7m7wJ5ilc0zSaElxaEFHJ3gqHPnhwZ5J+rEe5hgfC?=
 =?us-ascii?Q?u55WeBIiG12BkblbVtwtndzcz2XdMsjmTQUrvtVcyjKvsgynoYp261UwE3dw?=
 =?us-ascii?Q?4a5oInqOTwBko9np5UUV+dHQthrNDY3ebDqFx0aAa1Ki/LgWBzzayC7ZHkOC?=
 =?us-ascii?Q?bJ2D1FiLjfpksdy3iA3VkFxXD+Jkh87ipCB0prgh3yQ/wQUBgfEgDcHJx03k?=
 =?us-ascii?Q?GbOCN/x+RGOBA0piHw19V3JRHVBZXWn4hM5WoW2rSGwTGQPi1vXAgWK/J1im?=
 =?us-ascii?Q?zxf79ckq3glyugcGQ/bjRYWfDn0HbBrLK/wUpP9gMP6RqdqhdQEy19p0QE+I?=
 =?us-ascii?Q?lN//x9WE8PQYDdTonQ9586WC4e0TGf42Y4ce6P0u988U/jXyM2Uc9zwNE0mG?=
 =?us-ascii?Q?+3Pt+EQGycikexPr0cjQH6vCA39SEc4AAMrIuUBxz4y0WbLBsVTPJftPvr13?=
 =?us-ascii?Q?grGgen7mtWPnLnBkFizLQqI+vdKbOROERMSW9ijPjgxjo3otb8cPOwijkcVe?=
 =?us-ascii?Q?dbPmkV6xee68Hy12zJOim06zSKizIw8kfYR9hu1/zi3EvZHjnrg8OBVL6SEB?=
 =?us-ascii?Q?Mj32LNjXhaJf7E0a1gdDX5J4rABP5QNpgyRcYK9r9YIwoLsNS37MOq4zid8R?=
 =?us-ascii?Q?0mVHsjLu7FH98R59jmjjKjsl/sfHIfDH0xCUWXjE9QWl49V45gd8mXg4csTG?=
 =?us-ascii?Q?ee4DovHJw8jrtJ77j+8cIoHadKMgJD6qHWXQkX1XKSXqcXmKAQE6MlONjzA0?=
 =?us-ascii?Q?203WlhcNF/sTcJ+NrsSEiCkvkYFQRUf3xtvA4vfm7l+I5lo462mOibSO46WG?=
 =?us-ascii?Q?uLCWgBFxVlNloDDYqpSdIPppVK+lZJ4gE/KsbBvvGPn+VSEcAPftV9WLNx9U?=
 =?us-ascii?Q?iGGqCTH6UkWwS+y3nnPmSVsg6YireTEASqEl3NJRkMgPVZwDAwmulLtUj0+P?=
 =?us-ascii?Q?g6P32aNpLSXvu6c9xfF2q5YawbCC3TkYvMsfSVCUKsIW0TcWquR866qYqRqQ?=
 =?us-ascii?Q?z4ANC9DdDMkHYPkt05V+DufM5X2S6WR9YSGHmiWeIEFTco0/X7hLXaVdKImn?=
 =?us-ascii?Q?Hm5nMoX5tndmCwEp9wkp9uOI8i2obNgl6n5B5lRjuwscGFDJEWWR7hS4iIKM?=
 =?us-ascii?Q?316X+fLzaWHN3ojl2g15E6j8oodqTsIttl9jjLv4hzXcBy1EwkXaDDfIcaCZ?=
 =?us-ascii?Q?GUFXJegK0NtUwNJ7O0N9ktRljto0Tb0fe7X8d4jjV9e/HmBQYLEkZ4qnwP5b?=
 =?us-ascii?Q?AYtnpVFPEQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf752726-538c-42d6-b2c0-08df1ea4d7b4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:25.3595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRumqMr3ncFvIWcpqa92frNN8wwjhffItKgQElW3/9XxWoixwn9eEzdGRwb1JvKJqUx3GRfB857aZuJTNNAviQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

A falcon latches each interrupt cause that is raised in its IRQSTAT
register. On a RISC-V falcon, each cause is routed either to the host,
meaning the CPU, or to the falcon's own core, and two routing registers
hold that routing. The falcon signals the interrupt tree only when its
set of host-routed causes goes from empty to non-empty, so a handler
that clears the tree leaf while a cause is still latched has to write
INTR_RETRIGGER, which makes the falcon re-emit its causes. Turing
falcons have no INTR_RETRIGGER, and the routing registers have
different offsets from GA102 on.

Add IRQSTAT, INTR_RETRIGGER, and the two routing registers, the last at
both sets of offsets, and add two falcon HAL methods: one intersects an
IRQSTAT value with the routing registers, and one retriggers the
falcon, or does nothing on Turing. GA100 keeps the Turing HAL, as it
does for boot, and the retrigger register is a property of that HAL's
instance.

The two methods have no user yet.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs       | 21 ++++++-
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 16 ++++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 51 ++++++++++++++++-
 drivers/gpu/nova-core/regs.rs             | 69 +++++++++++++++++++++++
 4 files changed, 154 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 7e532889a1f4..2f02da52334e 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -12,6 +12,7 @@
         Architecture,
         Chipset, //
     },
+    regs,
 };
 
 mod ga102;
@@ -70,6 +71,24 @@ fn signature_reg_fuse_version(
     /// these. For anything above, the PIO registers appear to be masked to the CPU, so DMA is the
     /// only usable method.
     fn load_method(&self) -> LoadMethod;
+
+    /// Returns the causes in `latched` that are routed to the host, meaning the CPU, rather than
+    /// to the falcon's own RISC-V core.
+    ///
+    /// The causes routed to the core belong to the firmware running on it, and the host does not
+    /// service them.
+    #[expect(dead_code)]
+    fn host_routed_causes(
+        &self,
+        falcon: &Falcon<'_, E>,
+        latched: regs::NV_PFALCON_FALCON_IRQSTAT,
+    ) -> regs::NV_PFALCON_FALCON_IRQSTAT;
+
+    /// Retriggers the falcon, which then re-emits its host-routed causes into the interrupt tree.
+    ///
+    /// Turing falcons have no retrigger register, so on Turing this does nothing.
+    #[expect(dead_code)]
+    fn retrigger(&self, falcon: &Falcon<'_, E>);
 }
 
 /// Returns a boxed falcon HAL adequate for `chipset`.
@@ -86,7 +105,7 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
         }
         // GA100 boots like Turing so use Turing HAL
         Architecture::Ampere if chipset == Chipset::GA100 => {
-            KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
+            KBox::new(tu102::Tu102::<E>::ga100(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         Architecture::Ampere
         | Architecture::Ada
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index f9a8444cf840..b0eb1901d213 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -169,4 +169,20 @@ fn reset_eng(&self, falcon: &Falcon<'_, E>) -> Result {
     fn load_method(&self) -> LoadMethod {
         LoadMethod::Dma
     }
+
+    fn host_routed_causes(
+        &self,
+        falcon: &Falcon<'_, E>,
+        latched: regs::NV_PFALCON_FALCON_IRQSTAT,
+    ) -> regs::NV_PFALCON_FALCON_IRQSTAT {
+        let pfalcon2 = falcon.pfalcon2;
+        let mask = pfalcon2.read(regs::ga102::NV_PRISCV_RISCV_IRQMASK).value();
+        let dest = pfalcon2.read(regs::ga102::NV_PRISCV_RISCV_IRQDEST).value();
+
+        regs::NV_PFALCON_FALCON_IRQSTAT::from(latched.into_raw() & mask & dest)
+    }
+
+    fn retrigger(&self, falcon: &Falcon<'_, E>) {
+        super::tu102::retrigger_ga100(falcon);
+    }
 }
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index 7fc6e83c2566..bd66b7759ea6 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -5,6 +5,7 @@
 use kernel::{
     io::{
         poll::read_poll_timeout,
+        register::Array,
         Io, //
     },
     prelude::*,
@@ -23,14 +24,42 @@
 
 use super::FalconHal;
 
-pub(super) struct Tu102<E: FalconEngine>(PhantomData<E>);
+/// The falcon HAL for Turing and GA100. GA100 boots like a Turing, but unlike Turing, it has a
+/// retrigger register.
+pub(super) struct Tu102<E: FalconEngine> {
+    /// If `true`, the falcons have `NV_PFALCON_FALCON_INTR_RETRIGGER`.
+    #[expect(dead_code)]
+    has_intr_retrigger: bool,
+    _engine: PhantomData<E>,
+}
 
 impl<E: FalconEngine> Tu102<E> {
+    /// Returns the HAL of Turing falcons.
     pub(super) fn new() -> Self {
-        Self(PhantomData)
+        Self {
+            has_intr_retrigger: false,
+            _engine: PhantomData,
+        }
+    }
+
+    /// Returns the HAL of GA100 falcons: the Turing HAL, with the retrigger register.
+    pub(super) fn ga100() -> Self {
+        Self {
+            has_intr_retrigger: true,
+            _engine: PhantomData,
+        }
     }
 }
 
+/// Writes `NV_PFALCON_FALCON_INTR_RETRIGGER`.
+#[expect(dead_code)]
+pub(super) fn retrigger_ga100<E: FalconEngine>(falcon: &Falcon<'_, E>) {
+    falcon.pfalcon.write(
+        Array::at(0),
+        regs::NV_PFALCON_FALCON_INTR_RETRIGGER::zeroed().with_trigger(true),
+    );
+}
+
 impl<E: FalconEngine> FalconHal<E> for Tu102<E> {
     fn select_core(&self, _falcon: &Falcon<'_, E>) -> Result {
         Ok(())
@@ -79,4 +108,22 @@ fn reset_eng(&self, falcon: &Falcon<'_, E>) -> Result {
     fn load_method(&self) -> LoadMethod {
         LoadMethod::Pio
     }
+
+    fn host_routed_causes(
+        &self,
+        falcon: &Falcon<'_, E>,
+        latched: regs::NV_PFALCON_FALCON_IRQSTAT,
+    ) -> regs::NV_PFALCON_FALCON_IRQSTAT {
+        let pfalcon2 = falcon.pfalcon2;
+        let mask = pfalcon2.read(regs::tu102::NV_PRISCV_RISCV_IRQMASK).value();
+        let dest = pfalcon2.read(regs::tu102::NV_PRISCV_RISCV_IRQDEST).value();
+
+        regs::NV_PFALCON_FALCON_IRQSTAT::from(latched.into_raw() & mask & dest)
+    }
+
+    fn retrigger(&self, falcon: &Falcon<'_, E>) {
+        if self.has_intr_retrigger {
+            retrigger_ga100(falcon);
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 9978fb2803b0..88662da634dc 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -124,11 +124,25 @@ pub(crate) fn usable_fb_size(self) -> u64 {
 register! {
     base: PFalconRegisters;
 
+    /// Clears the latch of every cause whose bit is written as `1`. Write-only.
+    ///
+    /// The write ends the latch and not the source, so a cause driven from outside the falcon
+    /// stays set. "Retriggering a falcon" in `Documentation/gpu/nova/core/interrupts.rst` names
+    /// those causes.
     pub(crate) NV_PFALCON_FALCON_IRQSCLR(u32) @ 0x00000004 {
         6:6     swgen0 => bool;
         4:4     halt => bool;
     }
 
+    /// Interrupt causes latched in the falcon, one bit per cause, whichever target each is routed
+    /// to.
+    ///
+    /// The causes routed to the host are the ones also set in `NV_PRISCV_RISCV_IRQMASK` and
+    /// `NV_PRISCV_RISCV_IRQDEST`.
+    pub(crate) NV_PFALCON_FALCON_IRQSTAT(u32) @ 0x00000008 {
+        6:6     swgen0 => bool;
+    }
+
     pub(crate) NV_PFALCON_FALCON_MAILBOX0(u32) @ 0x00000040 {
         31:0    value => u32;
     }
@@ -256,6 +270,16 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         0:0     reset => bool;
     }
 
+    /// Makes the falcon re-emit its host-routed causes into the interrupt tree. Write-only.
+    ///
+    /// Present from GA100 on. See "Retriggering a falcon" in
+    /// `Documentation/gpu/nova/core/interrupts.rst`.
+    ///
+    /// The hardware headers declare two elements, and OpenRM writes only the first.
+    pub(crate) NV_PFALCON_FALCON_INTR_RETRIGGER(u32)[2] @ 0x000003e8 {
+        0:0     trigger => bool;
+    }
+
     pub(crate) NV_PFALCON_FBIF_TRANSCFG(u32)[8] @ 0x00000600 {
         2:2     mem_type => FalconFbifMemType;
         1:0     target ?=> FalconFbifTarget;
@@ -414,6 +438,29 @@ pub(crate) mod gm107 {
     }
 }
 
+pub(crate) mod tu102 {
+    use kernel::io::register;
+
+    use crate::falcon::PFalcon2Registers;
+
+    // The RISC-V interrupt routing registers, at the offsets that Turing and GA100 use.
+
+    register! {
+        base: PFalcon2Registers;
+
+        /// Enabled causes, one bit per cause. Read-only to the host.
+        pub(crate) NV_PRISCV_RISCV_IRQMASK(u32) @ 0x000002b4 {
+            31:0    value => u32;
+        }
+
+        /// Causes routed to the host, one bit per cause. A clear bit routes the cause to the
+        /// RISC-V core.
+        pub(crate) NV_PRISCV_RISCV_IRQDEST(u32) @ 0x000002b8 {
+            31:0    value => u32;
+        }
+    }
+}
+
 pub(crate) mod ga100 {
     use kernel::io::register;
 
@@ -430,6 +477,28 @@ pub(crate) mod ga100 {
     }
 }
 
+pub(crate) mod ga102 {
+    use kernel::io::register;
+
+    use crate::falcon::PFalcon2Registers;
+
+    // The RISC-V interrupt routing registers, at the offsets that GA102 and later use.
+
+    register! {
+        base: PFalcon2Registers;
+
+        /// Same as [`super::tu102::NV_PRISCV_RISCV_IRQMASK`], at the GA102 offset.
+        pub(crate) NV_PRISCV_RISCV_IRQMASK(u32) @ 0x00000528 {
+            31:0    value => u32;
+        }
+
+        /// Same as [`super::tu102::NV_PRISCV_RISCV_IRQDEST`], at the GA102 offset.
+        pub(crate) NV_PRISCV_RISCV_IRQDEST(u32) @ 0x0000052c {
+            31:0    value => u32;
+        }
+    }
+}
+
 pub(crate) const NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_SUCCESS: u32 = 0xff;
 
 pub(crate) mod gh100 {
-- 
2.55.0

