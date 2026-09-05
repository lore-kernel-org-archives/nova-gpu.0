Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010027.outbound.protection.outlook.com [52.101.85.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BF134D929
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 02:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788575889; cv=fail; b=X2R0u08QHj18zO54KAR9+/UMz1nurltP6gMgrQnKLVUK/cNliggAHsGs6HXmBwaWxm+Y9FNQcRPMwSgbIteQZtXJdpKKbpZeqS50mWxdHB1XjUAk17qubWaDNDTc7FH4Fcc95dDhu3VOgT4PShByfWSQM6uVYm0yXLxPaQXZLvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788575889; c=relaxed/simple;
	bh=++o1HYOql5R+gbzmqv1LJn3BpewV01Xr/Stcs9OUQ9c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aSplB79isNkRDm69p6XQYk51h4c2fQCR2blAn/hYM62J6lwF6Gey7Irz/aF6zw56X680xE4ELPJXPKpYbr67H7dK9BHhjSJ4zlyiF5SWNYPr//uAxmIHuI7np7Pqwv0RynefIZcb+oa9gItvIJQrlVXg3oCzuBGypH1851WN7h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l71y+cJZ; arc=fail smtp.client-ip=52.101.85.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l71y+cJZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTw9pQjiBg47bOjadna+znEw3CyAbzADTAgnFNqid5qB26lNj5C85dYIH5GoxWq2QI+XXh5eQpAHONfowAxO5mk1cd7tczwGI9GKE69ouqOgLo90M92mDb/YGsPklbJt8wGWl9b5pKlCN6WD/Kr92xC2gAhRSKBxoLwo0eyfB/yDztAbZQSfoo8KJ1MY/HOK7eMCofqp8JKVLMVdrG22JpDmIVn3qldywIfAMMxLMzUXyyTXmH23h24EiFoMypgmjUI6sPuXrUBPJ4q0qKn4eK6qH8eD7SR4iXl+5p5aVRpQTnAKh9+v8E46WggaoKakm/Gc95hcWvq/vjly7bNszA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yv8Jzef51eXewJ6/B6X/6fjnL6A7nkCFYF18NWWH6OA=;
 b=MIQesbZkYKHEmvIFIPVsbHVrW8KkRT80I9TOduAm7jU5Qq0ayeifrGudMz3oE00jtpbW53Y9p1Omblel1l/5Jtaby1VCRVwy2u031Rf2PhNjavc/cP/WymLUAmXQNyCkrdbg0Ui645wlRKQ3nK6itMoi2OqDLrmYK37Zf8NLRpjNe3ko5LVtJsrOOMH1SP+A4mzIToYHE0SYEDVeT9I2We8ibRcu5/89ES0bRIai4aBGTpssP2421qbEj6o5KOx4PzbYANuqpK/oJsmCtzMhFdnIAAE8LUmwc+p9bBxEHWfq875b+dNijV+gmFA3PQRt+wL9N0QBmYmMvx+Jgey84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv8Jzef51eXewJ6/B6X/6fjnL6A7nkCFYF18NWWH6OA=;
 b=l71y+cJZZv9MYK6PYpXh0KwctcXiiS61xk107f4zYs4ACYX/zepeFISNWzAu2ffreJLPJVMexl3RMowdlRXVz+DnlNxBIdV0RJnoa6b/mTD7gBtBlKccGc3269YMBteF7uf7be6CSQkRgl5+G360CH/qUgXXlRy0EcLB/YdbVDcyPForUUDWSf9dSM+RMUY4FPoSTIl4ep9xduaEaZhhvkHdPH7GjjOYXEMzrBtn5ohjSA/dPD/x3F0zayLUvorkvhEkmYswKYGCTBc6IdW1b17hQYzHtvMU1EQKHvJfGeUyVtWtcNnuo60Wr07pF0lpsjHGoO897IRT5gMuUUYITQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7481.namprd12.prod.outlook.com (2603:10b6:303:212::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 02:38:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 02:38:02 +0000
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
Subject: [PATCH] gpu: nova-core: gsp: fix a broken doc link on GspMessage
Date: Fri,  4 Sep 2026 19:38:00 -0700
Message-ID: <20260905023800.1293631-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f80937-7fba-4491-8b22-08df0af6b51b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|5023799004|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	n+Jx9/bse5trY+oKS38fq6r5zi1bUwDFlUBN+JPxlNzkVHD57F1+O3xwW+OJucyLbTwWaitc4Ym8AdLlO3HmhTACxJKicJ6eFHbnqLCkgMrRscjdJHi/PI/Ls7NLd8HdpSMM9TDM4xKFWPdpaZ1kcoI4E6tLsUi7qLSvb8RydmgugOYCAemhk6oY/miNk4bg8iZYgOqPN+ISHj8FwhimzDWgeHh9ewZs+JFDeFV9I82xI8pkDMTGfiqPEPGNNeI6Ki2SCn/mUPXPi+lakBr2xza5LPhcR8zaK407A+QYKgDGTHK5jht+blJufq4kbTg18dJMY4VDB6AbIFrXOwe9UOZv7IhIQoAEFou96ABqXkkXIWPXXlqFHxIM2aBzai/JBkFBYhAKhW+AnvxKiZ6qXOxHchOz7TBsMZgb/YXM3tMqYpIdhrc9+jE7l6wfonl6eZg8WFmjPZsvSbY0vFV0gjEFUlyvZ1cWys0iwgAdDEjdeRSQm0ke1Xnq5s1xYrYJu4Wbhz8iuLu8qCa/46416X0RxxD5JaKETLi7YdnCnjdIIWPd0uuoMvzjc4svvieOs0d/moS36Ps07x89kVwaMrSqWyeqLcw9NwX0OZ/ZQesURIMHA28KeMwtr+P7vIUMncBcN638otvh05Pf0vWSA6sSYvxQOG+7MSOLPf2qLy8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(5023799004)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kG4VXDpbQAeGN8rF3lJvtiZ4GW0dFpznnc/SFmrURFj98OnR0bOa7GGdKBww?=
 =?us-ascii?Q?ZWY18EhLCHm0eyWBpJUNpOdbTEVr428W7+NFjO74bDbl88cyMVSweZpqmCyj?=
 =?us-ascii?Q?ttlXKUNmLhAI8wXCyDBrAVsxlpyfDalQOE9mRyuFX5NkiaJuIkegfN0UanK9?=
 =?us-ascii?Q?6uQRQjXeowJObebYKg3N72OlB841efABoa1GZPvLNKn1RBLidbrCofu9jr7n?=
 =?us-ascii?Q?FixELccYqPoNp9jcSMa2sEACs6+lNMseVj0YICOSaFyKPtIaXuvyeBjpAJg/?=
 =?us-ascii?Q?lDsX3Y7llDWY1soKXf/ItB+WW56ST2PWk62t9AQfR+oc2n2HbND+mM3j46xq?=
 =?us-ascii?Q?55beKVdTLzD8nxNCPy+1HMTdusdb1PY9cETojRPU/X9eB9re4K2rhEXVhz5x?=
 =?us-ascii?Q?jBMpQuWidTxM3pFunumbWeAUn/BmPrJpyB8eFKWg0dnXo1S5/8MqW24lm1vA?=
 =?us-ascii?Q?CDhvK4JT8FEFURi6Wqjgut3uMUqf4zxwdiO7JNahhB6cjyqlEmj/oJdts8hO?=
 =?us-ascii?Q?AlKSPrdiKsI+z0aiNC2bkRsmfF/wbtpgz8PlH84rNKJRGnr8xSmOSQYpf6fF?=
 =?us-ascii?Q?cyDpo+jXan4iU9efprc/xJzzvf/bxhs91qWmJVpd+On000fkHmw4o4RbpHRz?=
 =?us-ascii?Q?lkzrvOnrt30NR9tnW3+1CmKAQuBOWzotEblJrb0r6XAmNIbYGYav11Roc/Ig?=
 =?us-ascii?Q?udaPxCxX1ZJ+2H+tQZ14mPIa1unal+DEr3JGw7Uwu/zJQGzBGAunYcz82Bpi?=
 =?us-ascii?Q?oajHXUlw8FWbKqzvl1m1axlUGtQkqLgHlOVzlSfNdkJk0zArIN6yRC1Tv2c2?=
 =?us-ascii?Q?oh4Yen5w8UgRJgXOkckKP34VkPN96nHpBWGB8CKrnhkQ+ed7pow7bCxvjO/1?=
 =?us-ascii?Q?b+4T28Fyrbc/TtYkbjGwmS2XHP5ixPhEOxDT4Hh6JhWKkgf3xLUmiXeyonJj?=
 =?us-ascii?Q?UFomCKPGFEVR/HhUdIB1MysqGilFO1cpV8OcIZ4HKZlMNGOkOfW2b7i9ShHC?=
 =?us-ascii?Q?wIffr/VYgLSPp0rJhu2Hb7sVTQABow0/92+ZxZ50jr14neGLYtOR/Uvep0p5?=
 =?us-ascii?Q?rdEH/CMWnUtDWhumHyaapTXgtINBKfWKCsdatl9k7v7DUYyrdV8sCFX7sG8v?=
 =?us-ascii?Q?viDS/KiZfhWIXwnc+XWAKgr3JgvNfhTIn2HhZxfytQn6DyoOucIwLryJK5WM?=
 =?us-ascii?Q?gB22DW4d3fmh+6SjTsHAb14zr068pFnZgsdwC7WTgSw4FOaVLLWQ4LvlRzBw?=
 =?us-ascii?Q?3NizXiGn/171VL/wgbGac3BwE57jMP1xRaz+dnvjFyjLbgTRRcoAi2BLtVOU?=
 =?us-ascii?Q?UwyUQ6I2sUnItIaEd6CWUoTlYpzjKtaLrW00wMtjL55BPZb9e/bc8tabM5rC?=
 =?us-ascii?Q?8NmXYXXFZU/ya9FAKaYTTFnYgVDhwLJqmoglbseeJDsm0uboyXYyijU2DE+9?=
 =?us-ascii?Q?e6A1aHWLBnXHZe4Z9QLaG24TTFpxV0tP19rwxjad+2h5Cmno1+oYMoSIsOhf?=
 =?us-ascii?Q?zXrItFGcEMfAxcJHjuxMl8/gA62Gqb2U1ggAkKN/M4c6ljQxXChJ6D/nu33/?=
 =?us-ascii?Q?BkTSiWaDCcT/5cK9ksbiKgH8uWACVMbBks9GWoHyxZGi9iN/7ZSrJoYraR6U?=
 =?us-ascii?Q?9oQpaR4KVCMG+TaaIp2SPctNl4Lwe1ewh3+fZfJy2YeTYiREnR7GM0bQDksv?=
 =?us-ascii?Q?zK0WEag7ZFoP5rEvBfPx5DmRqM1IIBCHXFsI2uoUkzGbdoXHrFD+F6HAcvuv?=
 =?us-ascii?Q?GxT6FgZsWQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f80937-7fba-4491-8b22-08df0af6b51b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 02:38:02.7892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTyVyczHsRBb/iPETkLd4PryQTmJcRZ/hrl7oTftarxs3A/EJxjEAL0yoI7GselKtl7CCS5r5OjzIgJE+odcxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7481

The doc comment on the GSP message type names Cmdq as the type that
defines wait_for_msg. That method belongs to CmdqInner, so the link has
no target. Nothing catches the break, because rustdoc resolves a link
only in an item it documents, and the kernel's rustdoc run skips private
items.

Point the link at CmdqInner.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 14a711307654..28876c4aa42c 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -478,7 +478,7 @@ struct GspCommand<'a> {
 
 /// A message ready to be processed from the message queue.
 ///
-/// This is the type returned by [`Cmdq::wait_for_msg`].
+/// This is the type returned by [`CmdqInner::wait_for_msg`].
 struct GspMessage<'a> {
     // Reference to the header of the message.
     header: &'a GspMsgElement,

base-commit: 6cb331644c441ff4101a4f8726283a6ed0d5947e
-- 
2.55.0

