Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C915322E3F0
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 02:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697591; cv=fail; b=iUata82C28O1rV5Iu+O3dtN1DO269LFWUnfGVA31pt3NWlLAIMYRyvPRT5W5BWfzl5i0p3qllNBsMLkTIB239Sw55t11jDyl74AFD9QFXoJyOj/bS5pTaSDh07kd1g+I9GMxLlpvEQwp/n63f5cNKjHDp6efIu6/RCBq9qPTnuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697591; c=relaxed/simple;
	bh=G76BlNBsWRzntyBHBZiIyKZ1w0eWXg6xKkKCdoWKKgU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kCZcZ+Q3ehVpUJEN1OlV9R8QrS9toQdTS+Oxh8/tgHizKaBjqoXyAAPqTFrsMISS3Rrzr3YzWHGic+3PrVhN4vchvq/+redKbGiiGkfYXzFcpJWn9CI+WloKP1j0W70ZEO+j0FoPEghuxcBS9ZPoVsg8oJjqu2qOs0GQfhQdZ8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gH3L+AfP; arc=fail smtp.client-ip=52.101.53.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gH3L+AfP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9K+CQk0c6ncB0CLOZj2ha36N6VAVmqXLGODKLP+addeWGHVh5YabS1Ll4mOCdo21YYxul/zP4A+o1W9EwDGEhSvAy1chzaqI2jiYrJ2m57ZTaLKMH2vpHfAAPRODl8T+Y0TOT5mmtDawvKfNoNDWOv3WK0BCzKZ/P4p4adzcHjpRuglcmvmO2DkaRDzPeVCstItSeUc6MnfytOIj5sElQyMZ0ftvUIpF1d6EMRkQjzRYmH2lgW2GQQh2yL/sDSCm8+tlIIpN4mYT/rcrwIaPHgg8x5GgFnDshzpXxyxeuB9UjB60WkEiXTkLIjFu8Az6hK3DxAYIcntpeUpeiANDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1PBZn0L+ZPEinyOubeRClfeUdhDDCUFvWOu7culCIM=;
 b=lY9ov0bYqY5O8U7tn5rYShI9DxaWdjjCm8ttg2Z3vOh/h37sGCzODQQV20/H/O15tPfwOgj0PgP+7+xMIHxq0O9XhtRssJI+Ejfk2k3exmVbqPVUH4OFpt7KQTOLgKbeHcoGsFr0vS65kTs/Qs8C4yLfeZkppBopTnH6lOMGByKIoxyA9N8E4UbbGidgRvznbo0jt1DDe6LxaaSkWPGGIb72HsWcXLcVRHRaIR/RgGwBqulvqWhk3qDRnYLsSsfo+xaoVeK0k4UfkXqrw7YdxmV2Nf9WBFbpjtTmC9jglqbRTztq+uxwcQcN4Fu3o5w2NrFKls/pGINTuTyvQwZksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1PBZn0L+ZPEinyOubeRClfeUdhDDCUFvWOu7culCIM=;
 b=gH3L+AfP7mBVmQqTX7r1lgqIrtQf37+NT6+YZeN9nbTLnZQO5yFvCHWT/XV6yytlTxxRsR55WfWy6AXECwKJ/YKCldckfft9MCTg6dBu4DR7VXj31mA23ei74xcrWnfPXi3e4N28gc8w/3ys3rtaHM2n5ndl6sxaIawUWz2cN6VIpLFM3kLVgLwa4b1uK0PZ1BeR7gfZd24Z6a8jYDn8ZvQ16ZRWj0vWtpShrR5fG7c0Vy6FieGNWD7cJWsAd3z4aLl4SJNGmIWpH4oDs/I236XUIc4Q4xwcQFpZgIL/fGto3vD+r+ROmXfvG8Cce0z7w7B9uVKj1i1suyl17X2WIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8015.namprd12.prod.outlook.com (2603:10b6:510:26a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.12; Fri, 18 Sep 2026 02:13:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 02:13:02 +0000
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
Subject: [PATCH 0/4] gpu: nova-core: debug logging essentials for r000
Date: Thu, 17 Sep 2026 19:12:45 -0700
Message-ID: <20260918021249.1187837-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ffce83-c681-4de2-7891-08df152a5ddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|366016|376014|10067099003|3023799007|11063799006|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Khi1zB3wdUTqmlZr7wN9P4PDnzuZ5/xIyqS+A75n/U4u695lGfZIon+43TiA9WrSVJSxPOCjqc8PWw+EoeEyFdpu1QZ4d0ANNUdDbuv9RRxXUpqLdVEBEjwdYYre1nNLHreLotZNCd6wDTIcgJz0cPRS00RpBXPyU44EtVlWPUIIU0ECCgRnetf+u/WBKN16XN/bEiLfzaMDtNtpsqVI2CrepQ0mDv/PtO0uCrK09ualkqteuKmNAfbL+O6+OBvgz9MMxhbjHr9JQ8iw4leHsqlCXlMr8BjDv7F/UWzB3tPhFr9hT2MoAU9j9MM2x+/nNK61v6JSBr8D+fN8yGeq1OVvmW2R1GehUP3Xb3sy+HQfqQ2VcGIUC8U12DpYwg9/hEDfmRl2zHDc2LxXWjtLC3KpG3Un73yMMqRPuBZKvcoo1NNWXweAhfuK5YN1oO/6JH1G6nU06u3ILQT89rzJcC5OGaOBN1l5Xjw9Zmmj69t4yD1pk7lrnT7cq/xSA2DulV3uxz77D6wp0DJLaHSc83FZtyWebLN2fA8RAO+L/V8aeQJ7uEDdQsnGzHRsNTDhpw7noMy8QJSDOrf7XbukBWRueNIZ8on7cnDVA+eqPKe+QdInyhBEyphcKVeQYwkzFUzrttSiDQIAhwbFCSx9/gn0WU62+I1KyhyoWndfSAs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(366016)(376014)(10067099003)(3023799007)(11063799006)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TYs2wM3XxEbx1tLUJWLdRWG2XzUqoesZs+WCZwSs1czD+1S4+8opzZcN1Zo8?=
 =?us-ascii?Q?F1PPwyy8ih6u507GKDjPHPASzK+FZDNpzjPTnOqfA4NYiAgHlSz8c/uHmiM+?=
 =?us-ascii?Q?QoMdU587/Rt2gLAA3RMYNmZQaGLTjFvQw6veRn/dVulhycLt5hmdGHpONcGC?=
 =?us-ascii?Q?t41dHaP3GkIU7gQomHLXqFaT7nbs5usOUsA2p+Q4HRzAAv1c9D0BopzRArDj?=
 =?us-ascii?Q?CNAtWmh6xLKM6jUwqjGwt5n8Ii3FwAPlNvSTsawzC2MK0BPTniYBRZVhLMPp?=
 =?us-ascii?Q?CSHwdAt4hd78vP1KVbCldxsnT/VUqkyPe3sA2YjSTKRfq6qOkg46DkAOq7YF?=
 =?us-ascii?Q?Z03958YTwiXCnQuWsX4/hSxu91uUhqoj3VTpyU/YpI4Z6PYo1XOSQ38G9SxL?=
 =?us-ascii?Q?EOOv2xdvNqCPPrkOGaK3qoLCxXRgI2h9LLy96jO1aJwbf4KZRd6hHuMhOY4c?=
 =?us-ascii?Q?loUf7aMOTV1CQveryuiSFTl4NfjkcInj38cOTu5NDUIJbmDUJkMCHaoZea54?=
 =?us-ascii?Q?N6jnvGcgMJNeypMJ2xjIYVmO7z+lnDQR23VZ0I61MJx1cBNCPoHT+MtlFU2t?=
 =?us-ascii?Q?GyhWi7Sdjz/5thj6pPkcena7OZ5zLU/pxktH4oP/a4V+PopnnUABFBukNgg1?=
 =?us-ascii?Q?2TRgwlTjR4c+BMHCD/Fs699dg/r3fv6SEu+0+sFqGsXhq7mecAlbecMevOnS?=
 =?us-ascii?Q?mcNPsL1aneqelHdUwrIHiGwDFl+nUuSB1DHiWkgFwtkFbSdZMmQLNKITPr3w?=
 =?us-ascii?Q?J//caD2NN/ZFnw8+9mmCZnTxTcDQnBDiNUTAAkl0/qIfxoGqsZshqN+ggex3?=
 =?us-ascii?Q?HzUyuKhlFvMS9LR2wXfGxRhEYrwn6/RpM6awteJ442pcxLjUj4sF8yk6aSnI?=
 =?us-ascii?Q?/ioDSFk+b/3P/JQ1tOteFf/DdpVfDJAy814a3cyBijUR7Zs9qgzII+pNjn2I?=
 =?us-ascii?Q?TDG6nW7M3MibDTlPmV7c7KAIKUW2ho/T7c0moHxiEe0/NCnU4P3qkdWTIrKU?=
 =?us-ascii?Q?94BsaX452yxwR56e0x38ygB8b4K2dF55YH7faVxNmjG0sVZG7Wj4sKCj1yVi?=
 =?us-ascii?Q?dtNnfmT86FdWqjv2o+WQH85UBR/W0+uXwHd+tEp2j8S0R2EtvTSrxJBq0So2?=
 =?us-ascii?Q?Qfj5YXy/oQVghbyhGZS5pYWjlb0lwuS1XqIPf9Nc9q01LoJmneA17vMBoyRi?=
 =?us-ascii?Q?46rA8MVL29cR3iJWofoTyVNtreTzSXWgxCGUveWDp4oBMpWXWlF6gDaZ+UzO?=
 =?us-ascii?Q?Oo1f7/vkpI8g5rRp08ZWoBrWhSMaxjbXEpiIweOSY1KxSlXizaPsSXOPgTWk?=
 =?us-ascii?Q?8VIfGdO2Ebt+dFC9wfRq9TZTIUmBEdfNo9RMg/af3q8oQbBVLM2v5kd7LkhE?=
 =?us-ascii?Q?MsjYOpR8f+4o4NnCpF17gn61DYA6MXIXJ4fmuzDX4YkqcEQDJz5U76MG/9PM?=
 =?us-ascii?Q?1TraGvNs9t2XNQLzXFvLwyRbpgUirsIRaBAP2ov+fn+n4eypyz6H0iITvTy7?=
 =?us-ascii?Q?cohfi3IghMd6E/qMGnCBraHNadN6oLUoUWTy8lClup4FTBHmmjwQJjzGR43R?=
 =?us-ascii?Q?p9NMRpcTx7p+49VGoBwVC/2qH9eUWi7i8qla+QY9jwdQvz/ozbsJmRXYOg3H?=
 =?us-ascii?Q?2Yq03te0igAwrqjOsi0WvaXKtSDzRV5PkPqqqiPRcFHVTSd5HI98ohJcfY8P?=
 =?us-ascii?Q?5BOh5VLsmJuzlfwsGtRs2tZhsCbaHdUtlsmCb13L50qT3eh7WUMmXOOFv4mb?=
 =?us-ascii?Q?wwKXhzAMpw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ffce83-c681-4de2-7891-08df152a5ddb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 02:13:01.9404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQ0cku2pshrRJ3i/5earHlRzydGnDV0MMLLxfLRaBWINRRXOuVn/IQWu0xAk8KwxZNUxCnYh9GKWGQWgjk49/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8015

Following up on the r000 v3 patchset that I just posted, this provides
some key logging enhancements for dmesg output, as well as re-enabling
decoding of GSP logs with the new r000 firmware (which has a new log
system that needs a little bit more information; specifically, Build
IDs).

These are a reworked and refreshed version of the debug-logging patches
of the r000 v2 series [1], which Alex asked to be moved into their own
patchset.

* Each log dump carries the header that the log decoder expects, with
  the firmware's build ID, so the decoder matches the dump to the right
  firmware ELF instead of the user guessing.

* Each GMC debug line prints the command by name and labels a received
  message as an event or a response, so that this line:

      GSP GMC: receive: seq# 9223372036854775808, command_id=0x10002, length=0xb0

  becomes this one:

      GSP GMC: event: seq# 0, command=EXEC_GENERIC_BOOTLOADER (0x10002), length=0xb0

A small preparatory patch keeps the NV_PMC_BOOT_42 implementation
field in the GPU spec, so that the log header takes the GPU's
architecture and implementation from the register fields, as Open RM
does.

The series applies on top of v3 of the r000 series [2], which in turn
applies on top of drm-rust-next plus:

* the interrupt tree series for GIN, the GPU Interrupt and Notification
  unit [3]
* Eliot Courtney's NVKV codec series [4]
* the three-patch radix3 cleanup [5]
* two lint fixes for the generated bindings, both already in mainline

A branch with everything applied:

    https://github.com/johnhubbard/linux/tree/nova-core-r615-plus-log-decoding-v0/

[1] https://lore.kernel.org/all/20260822015448.238214-1-jhubbard@nvidia.com/
[2] https://github.com/johnhubbard/linux/tree/nova-core-run-on-r615-or-later-v3/
[3] https://lore.kernel.org/all/20260912044400.677097-1-jhubbard@nvidia.com/
[4] https://lore.kernel.org/all/20260827-b4-nvkv-v2-0-0de9d5c8658c@nvidia.com/
[5] https://lore.kernel.org/all/20260913195413.742143-1-jhubbard@nvidia.com/

John Hubbard (4):
  gpu: nova-core: record the BOOT_42 implementation field in the GPU
    spec
  gpu: nova-core: enable decoding of the GSP firmware logs
  gpu: nova-core: gsp: print GMC command names in debug logs
  gpu: nova-core: gsp: distinguish GMC events from responses in debug
    logs

 drivers/gpu/nova-core/firmware/gsp.rs |  54 ++++++-
 drivers/gpu/nova-core/gpu.rs          |   9 +-
 drivers/gpu/nova-core/gsp.rs          | 212 ++++++++++++++++++++++----
 drivers/gpu/nova-core/gsp/boot.rs     |  11 +-
 drivers/gpu/nova-core/gsp/cmdq.rs     |  42 +++--
 drivers/gpu/nova-core/gsp/fw.rs       |  81 +++++++++-
 6 files changed, 355 insertions(+), 54 deletions(-)

-- 
2.55.0

