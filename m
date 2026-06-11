Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010025.outbound.protection.outlook.com [52.101.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A8321E0BA
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 01:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781140753; cv=fail; b=rjubjd3IIB0TkodPZJx1xZyaSHivGWMWNR88ZD6ANwrogyyJ7oFOmpKWCnFDHjpi49Fad7V4i4IQefpvvb3QX/jW9P+/grSwZ7SveiJw912TDwztgo6o99ix8JMCGQwo25WJLyQ7UjjSL16v2yT8NjhEpYfBZIi7SNb6AKRhKvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781140753; c=relaxed/simple;
	bh=EpQFMRL0AxkTYc6EBbVEzEoYcAb/K2ZtqcWqgWV3j/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dzipHwMlWg8CKbmdo3ZCRJzOUlx3uYTHJPlpWUrom7DUJ90BmkMuo3Xm8KEPMJADTKUSlGolxWuizCTTL8jMyxPcwYYnrB0m7QxgPAZELcJ65G9YPEIHHB4lTD1oNacdMaO7xe1ExumNMM5zKkJEWbRYqlAElqOru21o3rf9SwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BGp4WbKi; arc=fail smtp.client-ip=52.101.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BGp4WbKi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7Io70Qob9pFrxV5olaHShLA74OAm6I/TMtesXgxNDM5Y0RNKAOOUFRTECDHGZfv8xjzdqznt1GCC/p6VgPFW7VwMoTangWRtYOMY6WJKF7YeSkhSgLzu4aHp4Ry7/sBC7JxByT+kYb5Z2X5Zg5qdQiyJhrGC02x+njzqyfVENF72vNTajlWYMiEUMoVhm0wdIg0kP4wdStCgWbJ18yKZZwZwjSnXstJAU/nyTi5W8tDcgIpiJdndPOHWWj5w9FSMLDPkfQCThTW3hm3oyBpFPTCq8uvULVmbZ83c5WZ2yEvYVy7d2s0HKOzluD3Ttya4Jm3LCZn2AnxQmsDizliGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUNyLTPzKfG5w7YWv+2KQTLy5umuU6h8M0g7c5lyTCg=;
 b=fniUF03q9M+LGNSJB0Le4lL6qgSqwnJ1gOKiCuqy3eQzRAa2ygc/qVa7YFmZu8SwOOCJTvue+QsbWJFe6ZqC7ZasGDOt4+U6F5AqYQBC4nFO1czfvdLe7AP1710WqwyDxW1SarpLfD90Af/4+JANdAXg5No5IK1n6af1mOchSzX9FDN335f4/xUUww29Oi0xg1vdZNNZnyx3SEwsJrSmgA6SeHOHbOW0ReMgC/II6Qxeochis91jyPMCKNShUZrItrnm9cqUkbxGmftUTRknPidd9uMPcVlSD+Tr64u4/eWDORvnBcaHz3TXPeBImM3okhIB8NA8sWgK6BX5AjGaSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUNyLTPzKfG5w7YWv+2KQTLy5umuU6h8M0g7c5lyTCg=;
 b=BGp4WbKizsNPWS35Q4VNQV8p5PB7HwY0nYBE8OT0ICJOuL6lggAnbJMl44N0fsKPzKwfqMhIWcE3kbaW9FwqK31gR9RuS1PWi96FaDlohJzZ7F6JtlMeKfiUzO5F2R/O9Fr/0e2mWEkZqZmRC7AxxgWPqcseHL1+eKab0xRxc/1R8fI0CtTjn3DfycDo8zgH404gXmpfwquKEtrsjmQ3DpIOes8dV2WhUjrSsthAYZFiD40RmtfStzzC6TgMpnkkMQTz34zMpVurpB5rzGqgxFWQ13/HHRBEolIdH/7ZY+sqN58+8meF5nXacHh6i1GtOICvZgHVVrPovbLOg5djDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY5PR12MB6060.namprd12.prod.outlook.com (2603:10b6:930:2f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.11; Thu, 11 Jun 2026 01:19:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 01:19:07 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH v2 3/3] gpu: nova-core: fb: two tiny readability cleanups
Date: Wed, 10 Jun 2026 18:19:01 -0700
Message-ID: <20260611011901.84517-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611011901.84517-1-jhubbard@nvidia.com>
References: <20260611011901.84517-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0148.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY5PR12MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: 5afb6702-3214-48cc-7403-08dec7576ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	d5sjlOLGb+n28MW5eQYYqAdXfXBkeu2HlTS2X+nIIpwIM7KFonRV4ioqv82uszdZqjm6me+rpaWBtcPPkby0sAYz3IX5s9D6n86/48wjg8dBZUlNb+20X/OquAfWoCJFWIL1fWqkj+cn7LShfTGN9mP4/VYsRr1+XFOv16u85nBBkQT1SiJ1cpbdQzl3VQFRGWxbrj/h1LSV6hjvhKqUV+dNz5Lmgz8Hm023oz6ZVHw3gheM9EUKVgIIYXXoyPd/8M/wDedkQduusKSM4Afuo0xG7Q4s/jHkYYnj6ZaGg29N4KFu13rP95ZJ+VsDuTdbiZenewUskXzkpXcZJWmBDyqyT6U2yDKy3N0Zg5tSpQ0vbI4Bfdl/xS7XscJqfVwU0x4s6gzAyntY6U1W2evWRiWS2BBszvIdQ2p1NRVDN/yMU1zmJ5U++X52xrjERmWANwhbX39vN4RfEby7YIaWEmSgtX2m1qdHUdHW49637GTMG7ltR12sDlh8TcdTdCtWEEPvUF6PAdSuQPP8Z/Fs2KzM3oQl6NBe4OG6opthcfKoHHvAO6iBrePj8XdtpBrY6fIO8/P6KUfEZJvj05ViU13tPlbJWbWE7LDQqMGXYYvfuDqZbl7wxYHCS5M2+UJpykA3F7Qy1vnZUFEfKLlT7NuJ1AAh+stj4NO4YUyCG8F7CESdfVvKGtWmbA8ebuvS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k336d+DryCaZbNob63wb5ReZTE/ZU2Z5S20+p3bpKwfBpbIWKkJwWMGovdu1?=
 =?us-ascii?Q?n+IjzGGC8EqifldRroDxmfcnxdFodIzIbhOqn+Htng/NQ1nh1JrhSCfmZwZX?=
 =?us-ascii?Q?EI4PGXN+oJ0gC7TFQAi2XxV2vVF9meo5EV23aNe9nKmrd6mhqipMzsxbkM8J?=
 =?us-ascii?Q?TUbXqspWUG3Ol82HYvHOahApCDDLvPX2M3mQfJ2Qg0pqc4m8ej2EJCmuFg68?=
 =?us-ascii?Q?7wcbylXWqo9pu5uzWk/CGkaZ6u+aUYQsGsiahVNnp5qS9PgpDGx682yiyzh9?=
 =?us-ascii?Q?cVlP5OQobzPpRiwOuu1AW7TT0ny0T7PKnyf6uEyuSh+6sG0WBqIpxyCQ8QxV?=
 =?us-ascii?Q?1rEhl/1PXjnELY0Q2H5z3hYaqbaPQXNkr0FZUEbU8PSk1IYcL3dg4y5OvTYL?=
 =?us-ascii?Q?wK8rwT5xzH4d0EWUNLxq0lhpfPoLwpApCbx00rkIM0+w1Szd9yZ64+TdemDm?=
 =?us-ascii?Q?opF3ZQNUJLbC796DxJmnlsV0ELj7jSHJ/z5UfUnjQhYQs5Plau5Xh0RtAD9L?=
 =?us-ascii?Q?EBmcfC23BsTuCpDMYfLxSyxN3p4CAPdpa6YewJn8rEeoskYNC8nEc+KcQv7/?=
 =?us-ascii?Q?nqZF+TXNeAra37QsnZn2RlRuNfg5swe9a3/CrlXOn0R/DVKpIz+dpjR/1d5+?=
 =?us-ascii?Q?Y8pvFgr5hH1B/BXLJZ2X7MNyXcWTD883PUsmZ9fuOqqugJNxGKdkVcSzDfdS?=
 =?us-ascii?Q?aaxZ9cO/8VLcHe2FxDsZwWD2GUcZRjb10zWwmPyLafZUvRW5YHxDe4Hhj8AE?=
 =?us-ascii?Q?Z1cjnJpiKu4cEfWa027uV3xWIVoQE7p4njkxLmsm0G14fptBCNmzDZRn3W8B?=
 =?us-ascii?Q?zQwOnTGVEDVhL3NbbxIN0wXh+LHTP9XVsvypIr2Co5WupUxAhnGgG2Y0E8Cj?=
 =?us-ascii?Q?7UFk8sxZaAWToldEa56RGO65CV+prvrq9V9qGRBT05Ltugwgxy8WaSIfiTMO?=
 =?us-ascii?Q?ZTQeRYYaJ0Q+/Gd3cm1pbrH1X9tYFf2LKri/CtOjLFllz8HeV48yVPObQ3nG?=
 =?us-ascii?Q?wRnlhHY2/LBZoLL6B/7jWY1awwxH/4rzxFKumvnsOec7oSQCwb4TDkjn/ssA?=
 =?us-ascii?Q?Qt1WLQSw9m7nw5CoCyRNfsMUzJEhAtyRSrYtIgAABa4LizSly9Z4XroyI8F0?=
 =?us-ascii?Q?mAbbwolVIRyvhXoqMW3XZJXhdl4YnlF69Qi0m9G439QSjiY+kfiTWTCqb613?=
 =?us-ascii?Q?SqD0fsL/AdSWIWvQXz1TAuyskBXtUhtoN4G9DnDahTdi4BVNamBjVkCjF7Mq?=
 =?us-ascii?Q?BKPOdp/BB3T7SZBdxwl6HShOkWgFrI5ezRjNfCc2xEieI4gGGzR19O/wUkms?=
 =?us-ascii?Q?5KpmIng3nhazlr2eLeIOIjDPMK8XpZfVyOKjHZLqPkP7KygPv0TnSdedF90x?=
 =?us-ascii?Q?+WKRcdP4aNXC/fHxJkwhB7o0nD1o+o/x/fwy72ByBrMFjH8hKDWIbk7SBp1p?=
 =?us-ascii?Q?+QrLPz6elnHOkR9IZNQoxok+Iymn3h+W4R07M1tWhtOVFrrGuV4lsUHfRvfR?=
 =?us-ascii?Q?l6BB4XKi145AqowVTWsRC0ivHVpYpBV/ymvOOHc76kgs+qBMipeAXu3G1JVI?=
 =?us-ascii?Q?yKNXX6KtomO3Qd0R/YoAiSUsAyCTMy0XlQBupG5iOOvFy9SdZ4ZGNE5whP3W?=
 =?us-ascii?Q?FpMxNB3qppIahE+A/bzCsvRo4sAULli5pOmOwJvxR+pDGCO5okhYgRdTM4RS?=
 =?us-ascii?Q?T3Ab61ocajhldX/9R32KIvdYFuOsyBBqhr71jYa5jQrWbahuYfoy3CEcpNVh?=
 =?us-ascii?Q?ipZuJIYrZA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afb6702-3214-48cc-7403-08dec7576ede
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 01:19:07.0715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWnFgpVJ1uK/ctyw+fH84GG4P/ptzSPmDCjnW5s05e46n/gIxelzFA3gL5Qzz/tyHnjR+u5Ex6pRcFFsojKB5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6060

The Blackwell sysmem flush read helper composed the 64-bit address as
lo | (hi << 32). Write it as (hi << 32) | lo, the order humans expect
to read, matching the bit layout and the new Hopper helper.

Also, to prevent some copy-paste boilerplate doc comments,
remove the second copy of "see [`crate::fb::SysmemFlush`]" from regs.rs.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal/gb202.rs | 2 +-
 drivers/gpu/nova-core/regs.rs         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
index 6747ba6c9c13..b78e0970f66d 100644
--- a/drivers/gpu/nova-core/fb/hal/gb202.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -28,7 +28,7 @@ fn read_sysmem_flush_page_gb202(bar: Bar0<'_>) -> u64 {
             .adr(),
     );
 
-    lo | (hi << 32)
+    (hi << 32) | lo
 }
 
 /// Write the sysmem flush page address through the GB20x FBHUB0 registers.
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 7982778fd6cb..3f16365d3a0e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -126,7 +126,7 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
     }
 
     /// High bits of the physical system memory address used by the GPU to perform sysmembar
-    /// operations (see [`crate::fb::SysmemFlush`]).
+    /// operations.
     pub(crate) NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00100c40 {
         23:0    adr_63_40;
     }
-- 
2.54.0

