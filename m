Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE5E3090F5
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363779; cv=fail; b=EhW42OCNL+572NAAJN61eDinr6joGsaf7j3ae7QEVXlzbHSx24xYhfOnW2ECklmrYOU2O/L6OPQh1mHBGgh1gNgw2CtAOhqy8oPG2XNG8V1GlAbCPKrgeWaRJaHeQWrZuGUck2k61A/4PSMTEYBKpbPXus13heCZ8SzlmQEU8lE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363779; c=relaxed/simple;
	bh=R+yn65K7Dgyu73TTczhsrY71cpRuj/n6v+jRvD+eWNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jK11zjHLJ3iaMzUDlaY7TfX9auPSU75v0ug3yQee5fDuizV7PVSaMWKU0XhOboMVjC2MBQ9j6bAEHrxA834G/7sxC2T/4oEJPjri496pg9ygGXbvpppVI8PrQcKzkm6TMadbw8NiTbyNmWa2euiP5acmOaBvLH9Qsz41wx5cVxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lK+rrINs; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lK+rrINs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azh0m6/C+gIna/F/T94V51b9/rQraGgzSkJn/d3/m0CC5O7FQzLSxfV2vq0La9zBsbpdHOxedoj1gImkuOZgwpDKP9CqDwhK6l4TbsbQEy4JHsufRzPgNSqhpFuE/3hCaYaLNI1pxJ4qhl1Dyjk0hpBAwo58nqcoVWpU77alZRwi20mimjmuWGr5uk6cdg2qEfqig2x1jCsr0eDf6CGNdyDES7I5cIHI9jmA5A2Y/e15A7yxQ62OoasZFEZ8hAW9VVfZcSiiDqU3RZEN7KWGjyQIpEd871DUQZnVU8uGpZ53Cu89meBU/mUqmpfmiCQ/Qmla8S16mg6+dSEHph/z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U00yNLg6DCu6l6rixlgvVLrEbNfj4Gs3HVMh2rfBmfQ=;
 b=eox3pLiGGp89GJzAMyha/uf6nnRjanq75pVnc3brfsEDYThLwicHl927VS8FDNT4KT1qJdn6hslRisSTCi94yPfwVtfJQh/eXeQ4c+a27FK5WAHU+lsderMZiIyukXwjM8JHURO/PX/0dgZAX9X4Ff/ip23doerXvgukjBPVrgJNA9ygjbTmGdjB07+aP3iJqBKOdtRP9HYofFxnpg5fwEUd4zChIeNesBlwTnK2Ff02ym9o1TwftlLj5jiw2EZjMXPkq94/9TA1a71Iz6SqiJgN81Yg9SJAMr3fwDOI4JPYNP48PLE9OEoPEWakaP91YBIFP9R+C4GtKpknyGHyHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U00yNLg6DCu6l6rixlgvVLrEbNfj4Gs3HVMh2rfBmfQ=;
 b=lK+rrINs0Lr3ub/WSoOPYR9qyXbMESdxHqwycXxGIneM4I4bm97HBini+hSxIxLkN4YgEhATYG9miujLG/dueaN5+/ISUR67pHU/3rnP0r//gMxg9wLocZGapvA6UsJzkT6MBc94vLiQM8k1sift88aJUFDq+tw8/79iB3BTC3ynOTeIfzfvY1pzl1QprARdTltmMxxTMHB11cJNfR07Z968U3mZhiqpXElqF2XqPlrHpQVzLCJfffIL2WAXK/Fj8m8XdRgZeDtoLSftfsMFUu3JnvK8dhwdUxyPrI4cKvp1lTetfv/ON8GuONN0MB4KK+gmIVMcrhEnuLShVN49kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:56:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:56:12 +0000
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
Subject: [PATCH v2 25/31] gpu: nova-core: gsp: pass the remaining log buffers to GSP-RM
Date: Fri, 21 Aug 2026 18:54:42 -0700
Message-ID: <20260822015448.238214-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 4210284e-67d0-49ba-28d1-08defff08b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cAvnmegonsX1CNdQ5Q8YirqKxNK1hxmQhnsAVdkVo/m8+IgnIEJJsqk4ZBJZTvt0s2r+BHOxMfR5v/tyFpDgLdc/RTUjRnBqqDiIDp4e0Tu1+m7KIMNUOquHF/FdswjFF/+WgX2DHK771Pu8AGw6qhFS1UpRlcfkmszne4VMgNI5TJeqDiu9ICHH9SSY8E0EqY07N/j2nLwF4fucH05a4RGgKzN5qulT/3qhtZzo+1Samjafu6jAliEY8ChJcm9ldu2WC4bI6FWW7mjZGiQNy1Di2tg2jsAE7HmSz202S6izAbKzE+aA3xWvQy9bFXohxLgQWNcGvbmLst0jBw70Bc+AgNLKeA/RuOlyf2+97raXKqem8st3VUfPBsrXUd8XjBcGThFcxIaN85bDgsOhfFP/Cp1j4pQK1NW1hDcNLt/C3OmI1cd2u6AwWR8zsS5GwgA+J/if2ptr8tfhQvrNsoJ9wyPtrurb88IYWyI3HnGoq/nylBnZ1wviPstUvnHmA492Sxfj09+2x+2iwqr2TWTW63273uMiXHC6sYoOmKl/fJegcKRiqdgu8rEbwAE7FFAnrlDTmPS/Lsd53KF0bSBYSk+GunHzIifhVJNtjJ/sOzOLb9r5EWefXbcVQHxGa/SyDgmw5CgzMS2pOU+KJEEK0RNZsFxOp2Pag8Kbp5U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v42ClUVGtehcCjG4PWaa2t7VvhTHcngfFs1qXLz1YZdjZLl/BK+VN0QN1pNp?=
 =?us-ascii?Q?FyjwYNOP9D+AOdNGvxtNENWNkelcAHUA2uaD71AaoSpemF8fxN0+XQP8FJWf?=
 =?us-ascii?Q?sKmGNVBuGzuyKROfhpmg8myYdPHJ40ruWEpLlq1JuHSTZI9d1/yUT6ePkkhY?=
 =?us-ascii?Q?eDSIr2KKrC6NdXpwzhvkE4bvFrz6tF3dTzeckLPIlfgYW3uczacHd7xIbLyl?=
 =?us-ascii?Q?3m45guzX5CHA3RjCf2LD3syoHeMy7mwVE4DeXaQgZB0N2OFkdFpnOLd9LJ/A?=
 =?us-ascii?Q?iMnukqTilRw7dVgZRQZI19+Fgz5CxSU98pUVR8KJDY/vsn4CqUriZkheIpxb?=
 =?us-ascii?Q?11sN59N2OSZRR0D8Cwf7IoZ37gQAJE0jrwEokgLyHWPdBsv93TN1K4rNkIfo?=
 =?us-ascii?Q?gyMLCkAozKBuOWYPQ5e9xCrE42kLRbLDFJEP7s6RuhZZOBFvDLlLvm5xD04f?=
 =?us-ascii?Q?cy++x+kaaBq7TbB69NZu3L+oxEGhWBkAmrV98SZtYEOssjA2wES3iZwmDolA?=
 =?us-ascii?Q?bbKxmUspH9tUm26Bm6C5oDqI4swhootGOZ8HaJXBckv3VKSIJObNir+ZBPyG?=
 =?us-ascii?Q?+61WQdUKZRss7WRFguYptMuG3ut53Dd7Vf+3PNCQ7RBrERNCEgjh8K76Rhtw?=
 =?us-ascii?Q?M+dwYn/jUoqDODEkOzRCW6UUJnoJk7nO4IXujb4tNm/bl2pw8aNH6i1tLkFg?=
 =?us-ascii?Q?O/2YYoUAwvbXZfBZX4jtSaqkxzldTYu4JcnNPs579QOUnxB0+bu0jpm2Bez+?=
 =?us-ascii?Q?N3zNI+hz8me3wZMvZ4tMp542qnRW8jyhXcw3Jr1CiywL4l/OtniaAa0YPSWk?=
 =?us-ascii?Q?gzrm/t029DBwGr1Lymh8F10rrlDfuylHkcyk/J/hZFIyp/1+SQHUgjEBcxZl?=
 =?us-ascii?Q?dBEzQb0hkrH1aSOjs+q/48P2jb87rYu4VWrrtVnXGcLStQlyTvIv+/to7GUh?=
 =?us-ascii?Q?nd9n15CIZStgJonA1Y3HdPqSGXxS0RUn5nkykJEHG8KM20eSf4eVuCBE8HNV?=
 =?us-ascii?Q?YjdRGND0nWjdfgH9rJqQwhKjn7LHKHgLtkvXnAOyn1nPSsOqJIK6ULcQYXI7?=
 =?us-ascii?Q?gyJpDCD9YsCD+YfDYe2nJdg8PT1QZhWPJ0YIXA3rS+a6HUyW/cT9E2JIgI0+?=
 =?us-ascii?Q?FYXDGWK5GTYEjE7wc2JXmBup7J0KkI7cgujCXOLFW8rYjcxujuoFMWIvE+hX?=
 =?us-ascii?Q?wgqMaLOCj5I1kdndU6iQSu9iLL7Sdwu5+Sao5Pl+ues/wp433+9NlAvePJlW?=
 =?us-ascii?Q?77hsbDr5waofhLz7o9noy5hNl8lqG/qXNij8tPPRfJy9qfW3dndWP2NytxWQ?=
 =?us-ascii?Q?b7YBCBrR4g9ZY010D+IWmJv2Q0WUwWd4vkzPB+xlAXDUxV626A1PPgniSdwR?=
 =?us-ascii?Q?IRgQ4WrEDP07ELi1oi/Ihj717+fnmo5vhRSymspY4DJqIIWZ1Jquf88nSBnq?=
 =?us-ascii?Q?p1LI28QcwOD08N0fi4EYG2dFFf/mXTGu+tX3ztCcs81hzhD9HzoNdDHJ0w7B?=
 =?us-ascii?Q?C4V74/S6vu9v2E9ripow2lPGJb6kqCKARTOIrjDSz9gAIkcLWG4v/qc5E/yd?=
 =?us-ascii?Q?jjBKoPr8B66DcxR2Es7i/rVkF/1hjZ+abGzA0JZxNfK8rF8NAM/kCnnHTDGQ?=
 =?us-ascii?Q?CXIfAx7vRYgBgVS/6/ggXHXA3ix/zV1qCwZyPsPzotafjRC57ZbOOiB8R9oZ?=
 =?us-ascii?Q?Iu3eAU3hw494Q8gcDjCJvEMPk7BpBEQUXBzjOESI6MNjmJiD0vsfyY9LuFv+?=
 =?us-ascii?Q?SBxucvipDw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4210284e-67d0-49ba-28d1-08defff08b0c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:56:12.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ah7GoRu2tVoG0jSxe/eQTOX80P46NNSG29jyzzZLBpCxjKhCbHN3LNJuOzWfF84ueWvHsowirGbYWDNqH6neDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

The libos loader finds each log buffer by looking up its eight-byte name
in the init argument array, so a buffer the array does not name is never
written to.

Nova-core allocates six log buffers and gives all six a debugfs file,
but names only three, so the other three can never read back anything
but zeros.

Name all six. RMARGS moves to the end of the array, which does not
matter to a loader that searches by name.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 79fec8664ea9..0516f0a05136 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -346,7 +346,19 @@ pub(crate) fn new(
                         2,
                         LibosMemoryRegionInitArgument::new("LOGRM", &logrm.buffer),
                     )?;
-                    libos.init_at(3, LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
+                    libos.init_at(
+                        3,
+                        LibosMemoryRegionInitArgument::new("LOGMNOC", &logmnoc.buffer),
+                    )?;
+                    libos.init_at(
+                        4,
+                        LibosMemoryRegionInitArgument::new("LOGROOT", &logroot.buffer),
+                    )?;
+                    libos.init_at(
+                        5,
+                        LibosMemoryRegionInitArgument::new("LOGRMON", &logrmon.buffer),
+                    )?;
+                    libos.init_at(6, LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
 
                     libos.into()
                 },
-- 
2.55.0

