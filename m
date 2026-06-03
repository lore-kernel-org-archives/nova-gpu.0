Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF85B1C5F27
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 23:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530644; cv=fail; b=sCoexfjhzuaV40JECfAILrkQPo5zRWuh/Vci0QuG3SunobmeoMJ3SARMp9wHFK3GsIx+ncDCOnEzUBw2zLUiQq+K3jRQc5c+ovC1E3ISRpSPeWrAynWFmDJB0S7Vi1we2jAaVB2uG74Ziq8Wg7EZuDUx3T81Q0AM5QPTvE6qEh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530644; c=relaxed/simple;
	bh=mrgXOif6XxnwOYFmZX9j4HgmFz34P68lpY7sjnRebg8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HVe/3dlNJMJpYnph2iK5HOVkJ13gQqYU6KAD+x7iCrYTRc9UvcSxhrnfToTFrkoLb8/NPOSYLO1RvzG1/xcEngXly6wMuxiT6onUuV/kEMYk1JT8VYejfwwffdrHOfxBPydxfT5m/OQEDS62G5+utvtfuybYUct55cR/6yJYmu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ph3vIUh8; arc=fail smtp.client-ip=52.101.57.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ph3vIUh8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qi7kzcnvRH6kCgYO7bSNSx+GFSqY9crXKPZtFJImdHbik/Aw8B/NQ8+4g9FzMTeoptOEAWQrmplNTuEGrakbh9Ayo81SSYP8Mok/bATCTJCgExai7eKtvvVgiPwwR5N4NY//2ud4J36SnPuXEyQI2IXykQ5syCBpPTatVGkqZ0doiBovyfytFh/emAR4BNtrLjkQJeEpFrTWRtcAaTGDZl5s3scq734YV58ZjVu7la0aVbVpmQGWLhFXjhh5cyAKMnr+sZPEblMQ5/5aMu6nXf1laQThBhZTPmE9e82TCZHEiYwk4MpIEj2bNEe1jLRwSUpGDwWmuvPojiKdvmUwXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1E1UCcm9z290QeVPXAuCTSfLoSTlpeFtARBf06TJmrQ=;
 b=OzFbuSCzOXDvcTaeaXfGRVlDuc7fWUUq32Qxpzfa3v6EBAL2D8MSgDCNA6BQVkgz+nSPHhrpWICCP1f+uvb+hLTHqYVjkPbwDJaNhfHmz6LBCukvxCpxRsAx4D+iYz2NOKVnO0epCyXuoY2W0cGcjZXyAW47vKDcXscoESQezijFVGhDd1EQgZlT+wh4/ABK4vLUWT4Kn0lLBAQO9MTF2i2AVwT1VyEwZTNWapZwCOlS6Qyn4wMpcApdxvCUMlVZiokecmJsqqhDllUgh6AMYJ5a+VlYFeUb3dOVxVJbDUiGkMIu+WrhT52xUvy5II75dauJ0ysXquTNrVpix9zDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1E1UCcm9z290QeVPXAuCTSfLoSTlpeFtARBf06TJmrQ=;
 b=ph3vIUh8FiMdiAKiMhi40kqhDrgHQNKwb0g4oBDvKdOThhsXcbBX8+6EnAKEql2A4QlISmCtSlRYxtzv9Iqez5G+vhccSezsZ1NdMqm+5AVjm9g1Jhde6Uaq5lTMoylM+IKsQLJdb180i1bMKfz6vQTvVbCGFWYuI5GtjGpyHZIOgc1ZoJQzBx3R0amfJ0JbY2KIrdN12IPhzQKEqZiIuildEAmGoetz10vqTqui67bj8/6FQnZXvVyu9QO1rpzciUVpetejbjBCJlcKYysflsmuTELiav5rYA/b4ZL2H5QJUefsgY+ldg2Vc0arpPEKp63m6tOGFIJ+HBpXjURsLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6660.namprd12.prod.outlook.com (2603:10b6:510:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 23:50:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 23:50:36 +0000
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
Subject: [PATCH 0/2] gpu: nova-core: Hopper sysmem flush fix and FSP comment cleanup
Date: Wed,  3 Jun 2026 16:50:32 -0700
Message-ID: <20260603235034.131354-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0148.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 26734a2d-a743-499f-0a9a-08dec1cae84e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	OU18Qnyksotdyao/nfbkNzliKZNUPGszRG/j5L9cs/Xv9tEW+POv7oi2elgFlyQANCSmtSBgx8EGl34JVdIKbtGVzyqHIIA4VOg8vSerMSc5ZEH1+tA6BminBFIwXBGQZvaxGoXisr8NOckVUzG/Pbn1mzLgB9+htfIX2OlmZ5Ce194Gwd/SFPzY9Kxvs1DmSLjtuBjoImVg9YFfYcthLMYSPcb0e4N26qo2bNodXpMrmIVk7Vlq+oFbbHzCB7TVJijEAeEs32BnfrFQIVM3fAgCCPcDR1B57tHPclaVZ//POy421/HwlBwSZw0icV4D0b6GJXiNld9Y6cgk1+H0QJIHttdmqvZ2wKshzio4cmWqGoe/FO/RH1AxH8yA7N3zqBoljxOqcIFCAAXIwVZb3l6kStuowNVgZhnus5dWjuvZ143MNw/sRTSYuJf69434GfjOb0NGqYFkyQeW6uPyOIPsY7KszJ4aF0dR4JTMkbPMpP4KnMyBt9cWYxtlJ61cBWq1dxpbKN0MlEF24vTNOArNh/p/GcAKv1Wf5vnEOaPtJkgbxf4ft5GS2kriJD9aAy/b1q/BdqSCxZQ1p4js9Li++HgqmN5Bnru3XOuA0LJR3b/1OQeMnTwmkkO3ymho0kPaRjCaFmHsb3doCEI8loXgZKlaiKwyOZQSlR87gnB3OJSLVIzGZ/QivDVY5M+Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AYiV6983zZailmrf02PZU8S1wulO2YEh3YpSZfIwEN2fSdm4PXFZzxPKiVDc?=
 =?us-ascii?Q?f5tLtV28hzUhZrQW8PbYWn07dlwu6FduzTFJzLmItJ2VDQf3Q67GGspOWCf0?=
 =?us-ascii?Q?feC08gfxxPi2LcZmU4zsRKh1vIdlUiNxDgEaq4iZWNarzQoeSAXfI5FgMXtb?=
 =?us-ascii?Q?GGTwQe1Ah/OKCJi+uoo02HXxxIlgvgoEUi+Xssz5DJxFJwzCHviDS0sgiYbH?=
 =?us-ascii?Q?xWqWl3LmR2Y26lr+j0rj+7VOG8u62KX81mnOsMpLNeluRi25q0UY6fnP3znr?=
 =?us-ascii?Q?UkMli2bHDbC5nfix//uTSkuvAAlbqVF2H5u/dwGtsbQfTDt9hb9XtBMeEOJN?=
 =?us-ascii?Q?W3q22YyDPY/9Dl+wf1XHp4y4TWwZJnvBIKOx+TgdB7BL9w8gDjvpAl2OMI7p?=
 =?us-ascii?Q?q1wY8f2bNILmoqBmJewa1MLvXpFex5PwqnFwEuwNOrkWH0DqvUXvRU2XR/WL?=
 =?us-ascii?Q?fkCQx7IFvoFnUHUlhzk9wCg5J29gLScx+oQovsvxwG8pMGD2ucvBKehPdAAY?=
 =?us-ascii?Q?MhSwXC/1JouextltMMe7Td7YXfauqlO1xhym7tWI11xhs9y2YrRLMkU/vMNc?=
 =?us-ascii?Q?h8nlehUbVHs6HMpN4YewmpjFD7UX2lfgYFySJiy+DjDK5InujHuby074f91W?=
 =?us-ascii?Q?rh1UTt19+kftctVaV5fllNbAsVhg/xeMjxgKIxDIfWEa3goIEmsIxH7mKIN/?=
 =?us-ascii?Q?OSTy+QO0H9Ih5fJRM1T8XTmykuaU5PiKwBuCcGMDrQO9GQgEhwo+IA4iboXn?=
 =?us-ascii?Q?iMX3pEkAl4HmfJ1JpLiQz77hmJXRGQi7uZcSHSXNDN3CkPxYRPWpqVmSbQCe?=
 =?us-ascii?Q?nIGkoZMyJCXC2w0vzs8zeeJPnOlCwFaoHWHsHibXLkgZy64qiaZsMLbVrgVs?=
 =?us-ascii?Q?UmgJHMgQH/3qqpUZOgs5OWgui2d8XrIldmJU3XvCDgIQEdGrCjKVM7m+JmS1?=
 =?us-ascii?Q?0Eu8VuZA8O8SSPbYaW3Z7DUjfIfhLZh15NOoRDoDIgaKkK00YjsB25bvQJhr?=
 =?us-ascii?Q?30UktQLsGzMAwqOnLxm+GFVERgpFQfFZYKcI9dOx7wiNO8QkwKNjLV8bHutH?=
 =?us-ascii?Q?V0/BM6lkisV5NhZppeINdho3nTwxQgviExEY+bgzcNrYhcYIi/roT6L3P/4A?=
 =?us-ascii?Q?blrvvs+3vKP7Jtf61r6IR/Vuakwrz6kgyAveSqKCLrMmxr0tPlclzRuJzgFP?=
 =?us-ascii?Q?Xkgo0Kj8uPb87FMum1PetU4aAgk2Togxnbdw9nr/a76usN9KDy08FKewgdza?=
 =?us-ascii?Q?KBD+WS4FM3sKUQ9vHhTgypufuyO8+LChV2cD/ynm3jLbg0CFoeWLtqu2dlmU?=
 =?us-ascii?Q?VHyAgcaFKPseydOb55Y08+PVG3YRHd0xpin8wEoPtVC89x1I0tfBR+HJ8lT3?=
 =?us-ascii?Q?xwb6QLoOB8hiTj89ijQmrnlTI90veQqgBEFsRF9ZOGyQZZO7bpbs0Ed2PuXs?=
 =?us-ascii?Q?VmyQjM6Erx4CGdU/gMeunjtNB8qjDTRL9Km+PT70qU34B7mQ3jN/kz/lSiwo?=
 =?us-ascii?Q?gTd0mFfm9VsgONRsI5N2XsoG8E5j4AswFq7MnAqWd4yrfrD7IRoLtVCYFzVe?=
 =?us-ascii?Q?UKkj/Odki5Wan4YxT7JbRSzL1pN1CMKdVXlNTR2V3MQbsQ1ci8mFqbP8OlV1?=
 =?us-ascii?Q?gPBG2i2OH5zaahViKXM8c+JOvdCLBQ8Jiru9Nr8FR7PjXQLK/eZi9UPM/h3z?=
 =?us-ascii?Q?4hcWBAgydkdeLUG9PX2hACX7e5sauXx1/d2Lb7mN6Ry55BdfBpzfFsXPW652?=
 =?us-ascii?Q?vk2InykE7g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26734a2d-a743-499f-0a9a-08dec1cae84e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 23:50:35.9979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Da+1IFv2b8fp5X+QdDa3KWadkurc+NJ8DxorjXBBjzo41mbIlNPL2Bn6I9XK2+CqqiLmTo4DMAjLM1xmS4A4Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6660

A follow-up to the recently merged Hopper/Blackwell FSP series. The
Blackwell sysmem flush fix deliberately left Hopper for later; patch 1
is that fix, and patch 2 cleans up two stale comments nearby.

Based on drm-rust-next, on top of Gary Guo's "move lifetime to `Bar0`".

John Hubbard (2):
  gpu: nova-core: Hopper: use correct sysmem flush registers
  gpu: nova-core: clean up FSP FRTS comments

 drivers/gpu/nova-core/fb/hal/gb202.rs | 12 +++++------
 drivers/gpu/nova-core/fb/hal/gh100.rs | 31 ++++++++++++++++++++++++---
 drivers/gpu/nova-core/fsp.rs          |  7 +++---
 drivers/gpu/nova-core/regs.rs         | 27 ++++++++++++++++++-----
 4 files changed, 60 insertions(+), 17 deletions(-)


base-commit: 99676aed1fec109d62822e21a06760eb098dc5f4
-- 
2.54.0

