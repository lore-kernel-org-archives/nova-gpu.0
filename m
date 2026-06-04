Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012062.outbound.protection.outlook.com [40.107.209.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4086C1F3BA2
	for <nova-gpu@lists.linux.dev>; Thu,  4 Jun 2026 00:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780533578; cv=fail; b=ra+sxWdcKmydiYYI0CsCBusi1/iYrjOEJ+rj9zHEN/X8zRb+M+j5LVD/k5IlrHH3COJTago3gAs3rFriB5btAh4AkYgsfy26qVlOr1wgSIGwxvYpC4g0y5v+y4h7Ynl8KiF1LGQSC7psa49Jv9Hdfq0vrBrhfed1gN7xBbfkANc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780533578; c=relaxed/simple;
	bh=ZPM4Sa1evYMjgtqguP3c0DMA5QgD8gacdBQJ5PtzPlk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cjLbEIVXXt4FoNXfYcrOSA/bFgnlqAW4OdffOEc4iy5SbtRS1JvgcCdKZeEHZmRwbXC7rvlWIhSU8Z/C4kwUM2djH6mMpJDS6RtwgL6+TB96fRhw5wIRev6C2UfM5H3ZVBVsATh7KrepuKh6m6Z0FXu58UIiiCo6Injy661xjAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uTm7TymC; arc=fail smtp.client-ip=40.107.209.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uTm7TymC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ox55eSeld2v4nCx4JD2c2IUv5aVC4yAi5Km/X7TXp3H8SJZmltfQrSpGixvki52VGQK3Xs+77RhwxzvbiesaqcLK6Tx9XmolIDM/J0m4wTP8aw17q/oQ7Tc2QJkh2+aSe4BM6hoCpW8OdPQAammapdlLC57eBYhzOELQP4ZmIhkMLln9IHWDw9kJivWb4fR2xVeCQN2HbgCy2528KnioKkTIICuUYWvXb0Xt34jJkwZx/RRoOtmxM0W5cCEA2AV3rYFRbLDqf8fypI6B1+np3cv0rqNx+l7n8K9j0MG8UzeYEUGAe9chS/dd6ffkxgLKAVMnGkA0ckx3majaA49OEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDK7ohVNacrP+9nGxgQNuD3VlZFIXI87aX7ZW1dFaYQ=;
 b=lr53LpB7tctD5MZupE7v5mZT0WmJ7ylVp0yD3Rz09binrvVgP/SPoPuvaI6k1jOctgo9LYkvkQsoqQ3kphvCPi/ctODs+AhVcqj4kP1zOC/OhoBiNQyWWo4gX2iH0pTuchBV7IPsRJF9c00U6PuUTOMhb5O8/d+m0LWAuOHjtZLfHr/1shbxfoIejlAqCuZgzQAPRMAj+FEHL4A3+UoKK4CAMpBE88xqxpJU4fw5QH75sp5sryO/IS319jYMcQp/uvs4QBsRiI0+rw6M7BsmEDKQoWum4mSE29tuXwq624t1CzNLeR5XsCkoJYDGL9kWabrcFPf5+yv5fyd55j/TSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDK7ohVNacrP+9nGxgQNuD3VlZFIXI87aX7ZW1dFaYQ=;
 b=uTm7TymCaX1lYMOw5/9eCbGgukT7l6cZ/7LFHyxAT9sHPFWgY1JTSf/VDDzs9nRBwZgP9jUfOWGk4lFAHJkdMK1Jg/VGwDrjF+CyEf3PL6ps4/D9Xb85B/cTmGsLYAtT5dfd8B6oD82RTLcpOdknbEBVeLFWohjpNkA0ht4pRmHvADUjWvSLvjVk2W0FYdHGAPJzrn0VyFkxDgYy4fIteE4vpw4KHeapGY1YcEIYlDsJxdUWgaiLu6VzrHGDJ6/0cphhTq6Gl5XPkKA05oehty4GhW9WpTz54BnZQp4XMC3vkxK2oXIQpxFDYDff0qB5zHJk9kpJjikFzJpdXFCz8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB8649.namprd12.prod.outlook.com (2603:10b6:a03:53c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 00:39:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 00:39:33 +0000
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
Subject: [PATCH 0/1] gpu: nova-core: add SizeConstants trait for SZ_* constants
Date: Wed,  3 Jun 2026 17:39:29 -0700
Message-ID: <20260604003930.145465-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB8649:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b926644-1110-4524-c318-08dec1d1bee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	gV+nmwrDXm/v7RUPmpizApHx10jlGg3rcvyuhZxWrQn2ehQDKe+hpaKmoFpiLY2uVTYqHYerCGiBgjb6THWC06niyJhy1m/qOqzvYYhpqgCx9S5fCnKa087HpNYu+ghX0s15VkjO4tSD9rsNE5krsu1Rvfw4oS6oI4CRgllS10EciNFT1UZqVmdo8wMlX9o14ZtR4Sniimt7vFhyduhawCs4UdSIcbMF1b4ORK7e74W+RyH3x0yApZg2ZN1AM1JTPY4JC9TRggt79YMa6xRVcS7Py9ZTxUW9rIvcZrJSaJbV2bhkKAbMgZ6G66Ilfbv0kH0lLgjwdF7nVla7Afoa2cYBHbR53Q1Mg5ZxpBd0TrOhIovVGZRgKW7VbY+Cilnld2VlDt/gIzjqki9esacA0kVKuoW9nBYsKO89Mw0RJ1+aMOVzqCsK0hR02agD2cNXmew4ruoCK+7/RunkyxQYeEHe/aTB3Gn+0NEwa4e48+qNSCgQyx1l1swgXRK9VHl7FNpTB7a6JyJUXcfVQ4RBH3hkuhkxZmRPN45a/C5VTPzFbQy9Lep/hWFeae2gRx/uY6j4OIEVxsMhX4DTmAzhTdwETmljliuDuw6x8kKxlReHCYboAAYIGOJIbaAmb+xo2eNSq3MzY3GLotDMXTWzwEwiQ8divqLdoCTU6aGzYS/KRaQwA0qLagQ+OCBgBUCuNQUv/IAAew+FimRGlpun3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SU2CQgEV4EXGhVBPYj08SNwlyp7GKDkniiWW6OdWn7zIBqv+7Xas5ODKvSwB?=
 =?us-ascii?Q?ISPJ9isGPxqSNlXXdTrlEGdUG5MzuaHKHly0NQfLkFoEDKN8/Zvfd6nO8Y9C?=
 =?us-ascii?Q?NA/n1NCQ095Sx0HA+W3RliDGp+e3iarD8oxr7vtWqpKEkR+d3LJoM1uVNDin?=
 =?us-ascii?Q?dpUqrLGeQ3ULqwOMkpyGMnCKa/EiGtMuxQIk9ScNBvB471kj76/O/KV47KcF?=
 =?us-ascii?Q?1x3W6xmsssJXxAhBUt1q+tm8yOgRGulgPgV9L6cL4Rbl2khpQ092HrJ774nr?=
 =?us-ascii?Q?Lavxo9X8sDCsSMf36TjUGXy8WKJjS1o8hIoHJvYqz0KxJsn0Y7FkUdh8TxOH?=
 =?us-ascii?Q?YBKg4x2VPpewbwLsG5gwsEwx6aqu/cDWr6lP2sZO8ee+6EaIcUv7iXEoGahw?=
 =?us-ascii?Q?dxthLnIz9zKCbUyCq02MO/4qD3840Kxt8rDXjBx0aWB1SWTefKLSIvVRsTOo?=
 =?us-ascii?Q?7VsiNdrlvg71XSN5/YXcORc+RAXNIM3Yc92V3ZHdRcBpJRXHWE5JZ019Cvgo?=
 =?us-ascii?Q?XUcdSHNtbNueYPnjcM0e8qYDOiY3Kk0kzp3DIcxqsVn55HMvBV56Ov4qIvKj?=
 =?us-ascii?Q?tXYMxsCxFo7X0nJO9LIlxCTPjVsA59IqPjbcOKgLZ6MISAWSp9ra9tE/6yeM?=
 =?us-ascii?Q?P3v6YStQsHlSTp6ZElTEa5pWzbQHVrQ8o7DC5SCbyMgps1Q0tGLtBvuXandr?=
 =?us-ascii?Q?Q5gsu7ke7SK4Z7MiCj4Z04VguO6RpUZMa92fESTHuR50iGM/0FTQHZKO1zje?=
 =?us-ascii?Q?N2H1grrA3hiKl1OYLd6NbgKleIOyQcvmnFVZDVxrDDOjThCX4WvN82+o7gCJ?=
 =?us-ascii?Q?3FFP5KmQ3mXFHl2Tt5QBsTlDIYJb++4mdJRIhY8OXJO+9iSASo4Z7KRt4xlN?=
 =?us-ascii?Q?uGnJnZ8+tIAZ52BN/KeNF2d+yMpzvEYuV8raiwq08o13yNoxnCGMiUamoPZc?=
 =?us-ascii?Q?5oxKWSD1lKtCy6Fb/v8bShEai0e8Mo4lX1Ml/wmdIdZRgHo0+MjaecnwjQIQ?=
 =?us-ascii?Q?2RlTXNmNCPE5Ao+ZJlrd552wWH/jlHxZ3YvBQ6j0/9v0iUR8L/pxrfhS0AAz?=
 =?us-ascii?Q?y7RB6OwUPNAoNr6BdEejnP2mGB36/clH+/OiAfvv6m4M3OUbe/eKlq95FRrF?=
 =?us-ascii?Q?5ikK0T8j0tqyiBCu2Itiw5TpH38JpUTwOdOYi31jps2cJ2hfzQ87I4hrSahS?=
 =?us-ascii?Q?O+kOk9YhU2Pc38nEDU00x1TOX1myJNes5/KOKJdrobrhQGNOMmow1jHFnNfT?=
 =?us-ascii?Q?nTjeFmO3mDo98DVWD7Vw3+ne0dC3fWOC1A8JeD1kon88oo30lWJXkXRWEi+N?=
 =?us-ascii?Q?pwWu1mNPa3dWmB7eHNoT/dAFetHkvFZM3H2rlGfqr2pmqrdjssBhTiJbvdYG?=
 =?us-ascii?Q?xp4ojQsRrs80UwOsR7r2vZZ2+lKIDo9qukOP52TVko5TZ2PuBtkqoWf0f6CG?=
 =?us-ascii?Q?ti0biH7LaQQXjzZ0gsAhfCL6gfYPkrLxAwl3G0rcOyNdSD8zn5vOnanT0B7f?=
 =?us-ascii?Q?6+BIgNqQAPmQZx3YExwBcGFx8lyUQNKFisZjJs+erPqgWBg5t5FihDMyX6ma?=
 =?us-ascii?Q?shIIa7o6/3Acv/THdl+r/PtAbt7FvNRug3La/Ljxc51O3Itpb7dMcK/Cqpji?=
 =?us-ascii?Q?fSqPm/HGixgxL+sYonNzbr9LVmekye2j8I2ydbxHin6oU8SKOXc+84SU9e/o?=
 =?us-ascii?Q?Jr/IVf6zcfVaga2phesIURiR10PC2fRf7JdrbmBHOaQuFqnX9SBfc2wpbiVj?=
 =?us-ascii?Q?mkNffeDEqA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b926644-1110-4524-c318-08dec1d1bee4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 00:39:33.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6o8fXt2KTDihP9WUEACT0JyDZagr73X1z0DnffODG2pZ1MW0rWx0Ut7G1MzYg16wDEiTBTHnKzoo9trnM5mt7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8649

v6 is here:
    https://lore.kernel.org/all/20260411024118.471294-1-jhubbard@nvidia.com/

Changes in v7:

* v6 patch 1/2 was already applied as commit 98e508e5b016 ("gpu:
  nova-core: use SizeConstants trait for u64 size constants") on
  drm-rust-next, so this series is now a single standalone patch.

* Moved the todo entry to Documentation/gpu/todo.rst per Danilo's
  suggestion.

John Hubbard (1):
  gpu: add todo entry for device address type wrappers

 Documentation/gpu/todo.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)


base-commit: 99676aed1fec109d62822e21a06760eb098dc5f4
-- 
2.54.0

