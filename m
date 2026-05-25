Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011005.outbound.protection.outlook.com [52.101.52.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA1938655B
	for <nova-gpu@lists.linux.dev>; Mon, 25 May 2026 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779717467; cv=fail; b=kocOCRzL2eMEVgalW1LVQStn2wA1dG/geXWDrqa1+USKwbKdosoYSAcW6i368neVA4pdBINj63S2Ugs9mtQpLe5yvh8cfXoNZiOHl7Z44vh2+9tfeC3qSWrztskjFza1L/D09zTQHYKRnUD79N/+8RxNpiDSYeDG/19acoVZCb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779717467; c=relaxed/simple;
	bh=VZOuXcTMthMMkzvWZcqLkhYLq8c17jPUhMRtiXarCrE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=g1ly/YMfcd816s/1kv+FLpq9DFI5xeIQCJowm2gaAMslf7a1vKpb9mUqeAOm5wzz9epeCluPegTtWoQs1mgjOoHpWEbDzTV9+XlADdG9y3Og6mMJJ6HXWXjpA0RmpEoZLv6Aj6I7y0Va+lmrAKex3QL00+YXQ/RNGpMFLpz9X+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ntPMn3T9; arc=fail smtp.client-ip=52.101.52.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ntPMn3T9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzLfHwOW0HsfMqyfkVoK+pEau5JvRy0oJcnLZdRHrj6pUloJKOdnatwnhH/I4j9xqhNnDVbhKLqhd3I942QGLjJHwtGypC9FUHdO2XoblkfLhJlWTgQnKqRMyAlpnW7EscbxDuiYDeQVI1Lp3TYEgEVDlY0TRfy2AJd/sCBwvoUiVI97F6JiF2sIT/mDwHzpT0+1x1qtGHPfD7kXFfMiHG3dyVIIoXVNiQLPfF9gb3b5ip3TD5ji9YCnpoMnBIzTNel86gd2iYtVUOYjWyzSiAtpZT9ifi6ULINJpX6H+sB/DkOXT7d4rnl3MOYK/YjA4wTmMQlFN+LTHLdAsfdOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvlTF0eTDIWcSd9/lgWT+OE1srWxf25n3rxqBkV5HoI=;
 b=gei8l5ZpEgaFrWz297uuGnNNCBrwPRsJnijxoKd/Lk6MfGO12LmngSTYL2JBFoLqQ221e6XWVdQiFxbdlbcAmNX9YQlnBLEfJ2YcbfkKho/Btv9m5lQ/WaE6XS0NkSTh+7y6WskTQGf+YpptDOlsyN0cOCQRQQ24Fpcprq3EqZi9THANqeEnkN2D8rXzOAAXFtEkaZxryM4+98nU6imqwpAiIimezh4g65HH4DZoUJ8Q+U6o9HtTj7h82g0pLLoRiu5OZ1XX58huWVxtnsizU6wYyo+a607C31Pahs90ovHrrMpxbVrcy39kG3nCdv+vu5PVFENyM5hQb7EaDlPcDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvlTF0eTDIWcSd9/lgWT+OE1srWxf25n3rxqBkV5HoI=;
 b=ntPMn3T9xYXYaZO7cD4DZbH/Xx//VSb0wPRqNffpAemC9xS8DWGvYYLorxWbCplytHPQAIgmm9brTS0ABDanBVo1VdfaTW5y2PPOcOqj0TPLtIDt3Nvd/TnyGS5yk9QIFRE/0eVGcChLCdh+AL7LnL5L83MIjUtf7GDuozPA3GX9Qrcq7QULKiZ5MlO2LiGR5dmoFOwAXKv3AIy4HMiFIAeP1TZWCPOlDPM7UF/dXDLJeO0XZPA1aofISuvy4EMmIfrsM8/dRuE6fcLu3gf7SrjEuSkxiVP3Vzvkc7SnsAdH4JKs+Elmq9mYTfhWj24eC8EpVIhCaUwfK3v+5v7h5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB9500.namprd12.prod.outlook.com (2603:10b6:208:596::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 13:57:41 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 13:57:41 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v5 00/22] gpu: nova-core: vbios: harden various array
 accesses and refactor
Date: Mon, 25 May 2026 22:57:18 +0900
Message-Id: <20260525-fix-vbios-v5-0-e5e455251537@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQy2rDMBAF0F8JWldlZvSw01X+o2ShZzOF2sVKR
 EPwv1dOC1XJ8qJ77oBuoqSFUxEvu5tYUuXC89SCedqJcHLTW5IcWxYEZEHDXmb+ktXzXGS0dkz
 7QBhJidb/XFJ7vG+9Hn9yufj3FM7bwNY4cTnPy/V+rOLW+91F6HYrSpA+2DxgRKOiPUyVI7vnM
 H+IbbhST3VPqdEBTFQQ0XrvHqjqKGFPVaNjtnp0KQ9uNA9U/1GD/UdU3Wi7mQkhGAv0j67r+g1
 LdO1FZgEAAA==
X-Change-ID: 20260409-fix-vbios-d668e9c21d23
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 1354ce1e-5099-478f-c974-08deba6596a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|11063799006|6133799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dtpQCkUKtg0kChXNGPKXt6TZoNQE7SUttJDoUg3ULEAu+NJaGS/alCzRJcGKTJJTRHOgXAjOp+BvYev5a6tbkBALnRqGgB8HzgoiKaWYJYmNF08n1wuX3AwtIYNn4L9xz5trh5bwEUWKVNadS4nPJgcXBzviUo9Dkx98/7It7OsU0g3OCviBcX6iVTcVyRsIxlPqhL99USDn1eanOQJC6l/Fn2CelVl2XUUQXvtSDmsOI4N/k2uMFmgxIFnS2eHLOF84lzyJq14SPRBEGnM3HBbtOcbYndm76OBM+PQ618AYLZFZpQ5jAPuuHCH1ZcVKmOQ43CZqkR8dK9TsebEN18Q0imij4+cJCxlQP4u96KfUWV+6QQe9juPFavJ0QwJfrP8j2tCs3rTaSdTgb3X9GXNsZ10Z1b+3406gSLlSJqNLAgWhtDR/dj7fQWV36MG0PtEy29W/cn8gsJ+5/Nk2HistYfD7IC/F8Okt+lLteWOeP8vuVGc9S0MSRl5nB+SAlir8JCgsgL1Ou5Q0IHna3ctMROomj7X/hYunXeUxacOxrDpIne6jtaLiJI03+2KThkPvUEXaFYflSj/Vt4/rfg8npFRKCHR8696V4nNCDL7oBlzFFXGLHCVm0w//vcQLmJ45hQzaxQtT2fEeGr8OdV18M3q35mtpzCogb18iXugE0+lcUal3GS+hegtM958FAgddGeDdjEG7dxpMQLsW/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(11063799006)(6133799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHlvdDZXMnl4dW9WdDFwRFBTWlZYbDgrbmFJelpjc0pyQ0JrNGIwMjRaeXJG?=
 =?utf-8?B?V1lhN2hpSG1TOUhWblZXWi85NEw5YllEWXlvSVFLbXRDdHEzRlVDK29ib2li?=
 =?utf-8?B?TGFvOXgyOWlkcnlsQVdRNFd2SkNYaEI1V1VHOSs0a1VFeXR3QjFXOURoTWNq?=
 =?utf-8?B?QUxVK1BGSGxJMEdneXBQemkzWS8xMjF2M2VuU3FYY3VtMkxGazNPdnJOTkhz?=
 =?utf-8?B?OFpMVTB5MlhmUDhqcXptOXRXQWpweCtGaFNRMTNITmpMNERscUhiTW13VERy?=
 =?utf-8?B?eVhTRWYrVGpEVUQyN0hXWjViNVE4cDc5dGtrNlZxaWxIYVNNRFVVR0hGZE81?=
 =?utf-8?B?ZmdIaEJoazBOb0xhbnlSaHRFdE9Gc1dwdTRTYVRSTHZvRXFZcEM3SzN3WVY3?=
 =?utf-8?B?WERTeWJyRytNa2grSW1NUC8vcm45QW1kaFV6QXFWSGZkZ1VvQ2FockpvMlNx?=
 =?utf-8?B?eEJEVHRaTERmRDZKOU9tanJNcG13VGxTZkpqaSs5NEordXJuU1hSN2wvNkJs?=
 =?utf-8?B?NGh5ZnBXc0ZMcjdnT3pvbWtYaWduRlM5WmlhdGZPU2phS0M2Rmg2M2JRMWND?=
 =?utf-8?B?eHhxRmptQlRNckVxS3hROXpzT094cjJLRXFlSHVuQlMxTXVSTVpLRlNPc3dF?=
 =?utf-8?B?RDJ4RTRPalg4YWVvQitXQk8rUVlJRjl0WWtpbGp4Vm5HV3luS3lqZXdSQXRW?=
 =?utf-8?B?QWc5SjdvamRZR0dYWm9pU3V1M21GeEZMcU9iUktlSDJ2MHpITkJ1Y3poWk8v?=
 =?utf-8?B?dzJLQVJCWFBjdjM1aWFHR2J1bElLMkdhTm9pOEk5d1FNa1UzVG1FaUFjNWdp?=
 =?utf-8?B?N0VlSjkyL1NiNkZUblVIZjFDVWVDZ3ptYXR6V1JQSVVpbnVybzNBRWIzaUZI?=
 =?utf-8?B?Um5neDhGdi9LekhkbnBCNHFnTUJEWTByY0ZkcEw5akNyQkk2VC9tZDZEdzBJ?=
 =?utf-8?B?aDREekVqTHFKMzBCZ1RrUk9VakkwcjRtTGhRVkg2UW1jdVVhYzhyR0lBSS8x?=
 =?utf-8?B?QXFseDVyQWltYjNlOEpBR1EwUmRoSXVMUWN6VGM0ZlAvRjdBZlgwdTY4bGwx?=
 =?utf-8?B?d1ByZndhWVZlU1U2a2RjQ1lXczRqSlZOZXhCK0hURnIwWGV4UmRsUmxYMnBD?=
 =?utf-8?B?UTVOSDJxdmpqaFlIVW5CUGF5VWlqNVZvWWFkTUpWVThVQTIzMnhMejRMZTBw?=
 =?utf-8?B?NnV3UXdtTkJqeVYva3FPQjNOMEhoeGJIY3RhaEVTTTBLTUVycUFmOEtGOEsy?=
 =?utf-8?B?OTBYeDc5TWliUzN6bDBETUVzZGt6WWExeHVMREtUNWtUVklYcHJwQ2ZnZk8y?=
 =?utf-8?B?a0pOaUJKTXA1N3RGd1FKQmFHRm1HNlY1cVh4b21lMjFUOHBZM0xmaUdxdERJ?=
 =?utf-8?B?M3hpd0NnY1RwVEJOaVg3U0xydnljb2Nxc0U0TStvSS9NT1VDbTc2WDd5TjlP?=
 =?utf-8?B?RHJvTXF5UjVHbUpmZFFSbDNXaW01cEZvc1p2bTRYLzV2ZUpVZUgwSkcwM2tT?=
 =?utf-8?B?anVTWXVzZGpENXVMOEVLZVN6ckZzSU82TER4ZDArZVJFNFJFNkZmd1BJYkxK?=
 =?utf-8?B?T2o0RGZCeHo1anIyMmFNbmp3RWUyU0ZVWDFINk9zbnNVRi9KblBWODRtY0RR?=
 =?utf-8?B?b2RiT244aC9iOWtkdnhPekloUmFSak0rV3VDbTdFbExnS25aQVBnUEV5T1Zk?=
 =?utf-8?B?QWx2UmZWMzZaeFZ5ZkNHYUthZUhleFB1VjQzYlhFanpKUko1d3ZXdXp6YnBR?=
 =?utf-8?B?UWJ0ZzhaUkwvUFBqazBzS2hnUUR6RGROZFpaQXhsM0g5QTRrSFplMkJ0SER0?=
 =?utf-8?B?N1pyMzczN0oxQUIyMFU1TjQxNGdwVm42NC9tejFaTEtKdEs3eTc5bDUxTXly?=
 =?utf-8?B?L2pIMVQxeVRxWlpYVWNxOTEvU0ZoZU5zMHpyQmhQci9IWjdjUzJYYTlKdExW?=
 =?utf-8?B?N1NRV0N6OGJlcW9KTkdkNjlQdkE4UWNGbCs5aUExNkI0RVhpTlJkeEVxVGc0?=
 =?utf-8?B?bjYvSVdlOTltbFhac1JSaExSemdmTmZWSlZOemp0UTdSUHR1azNhZENXd2Fr?=
 =?utf-8?B?cUh2OW5NSm1yRkVSOWcvNU1HNUN1bjNCazEvLzM2MFFRVGFpVUJRUmRVWlR5?=
 =?utf-8?B?ZlMvN1lSSzc4S2xXZlRORWpGQzd5VnRzSFFOajhvQ2lkdGlDRGpyMXdMSVNr?=
 =?utf-8?B?UlpySXFXakVzWDhoeVBJaEVRdm1jTWNXLzV6UzBlbGZTQTlra0JacnpWNGJS?=
 =?utf-8?B?RmR2M0o3dEhuek8xM0lYbWlqK3FsTnYrc29sSXB0Q0hOYXhlckd4R0J0MlRQ?=
 =?utf-8?B?aHI3M0xhbzVjcUxrL3diTlFFbmM2emhlbGR5SG1ndG1MY0taWXUzSytEYm12?=
 =?utf-8?Q?eZqatupt7zK4bSCN1XdjlOFPJ1m1m/s5ceQ0l4PhxZoK3?=
X-MS-Exchange-AntiSpam-MessageData-1: +DPclotfnPhHCw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1354ce1e-5099-478f-c974-08deba6596a3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 13:57:41.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NeTZ8pDTrL4/veak3oasI4ou94fdOeBhgXeyTYlXnCyuYeF12MzAHUZ7+2KaJ1Sm+wfMFTt4nUo99dciyQd+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9500

We have some code that accesses arrays based on values from firmware.
This patch series makes a bunch of those accesses more robust. This
series only touches accesses that are not guaranteed to be safe by local
invariants - some accesses are safe due to earlier checks and I haven't
modified those.

This series also refactors and removes some code that can be simplified.
In particular, it removes `FwSecBiosBuilder`, removes unused fields,
and moves type and constant definitions closer to their usages.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Changes in v5:
- Remove "two fwsec image" logic, instead build contiguous fwsec block
- Extra patch to remove unused `rom_header` member
- Remove no longer useful debug logging
- Also moved IFR register defs into fn and removed pub(crate) (forgot
  to do this before)
- Link to v4: https://patch.msgid.link/20260519-fix-vbios-v4-0-5d3f210c5602@nvidia.com

Changes in v4:
- Split BIOS_MAX_SCAN_LEN patch into multiple per review comments
- Consolidate bios max scan length checking
- Convert more structs to use FromBytes since we assume little endian
- Remove unused PciRomHeader fields
- Drop unused types / imports
- Move constants+helpers closer to usage locations
- Link to v3: https://patch.msgid.link/20260421-fix-vbios-v3-0-8f648aef7a85@nvidia.com

Changes in v3:
- Use first PCI-AT and FWSEC images instead of erroring.
- Expand commit messages.
- Add Joel's Reviewed-by's (thanks!)
- Link to v2: https://patch.msgid.link/20260414-fix-vbios-v2-0-705d30d16bba@nvidia.com

Changes in v2:
- Add Joel's reviewed-by tags.
- Remove unnecessary code like `falcon_data_offset` from
  `FwSecBiosBuilder`
- Push offset handling into `falcon_data_ptr` (renamed)
- Simplify `setup_falcon_data`
- Add checking for spurious PCI-AT and FWSEC images.
- Remove `FwSecBiosBuilder`
- Link to v1: https://patch.msgid.link/20260410-fix-vbios-v1-0-bc6f71d153d6@nvidia.com

---
Eliot Courtney (22):
      gpu: nova-core: vbios: stop scanning at BIOS_MAX_SCAN_LEN
      gpu: nova-core: vbios: use checked arithmetic for bios image range end
      gpu: nova-core: vbios: avoid reading too far in read_more_at_offset
      gpu: nova-core: vbios: read BitToken using FromBytes
      gpu: nova-core: vbios: use checked ops and accesses in `FwSecBiosImage::ucode`
      gpu: nova-core: vbios: use checked access in `FwSecBiosImage::header`
      gpu: nova-core: vbios: use checked accesses in `setup_falcon_data`
      gpu: nova-core: vbios: drop unused falcon_data_offset from FwSecBiosBuilder
      gpu: nova-core: vbios: keep PmuLookupTable local in setup_falcon_data
      gpu: nova-core: vbios: compute FWSEC-relative Falcon data offset
      gpu: nova-core: vbios: simplify setup_falcon_data
      gpu: nova-core: vbios: read PMU lookup entries using FromBytes
      gpu: nova-core: vbios: store PMU lookup entries in a KVVec
      gpu: nova-core: vbios: construct `FwSecBiosImage` directly from BIOS images
      gpu: nova-core: vbios: use the first PCI-AT image
      gpu: nova-core: vbios: use single logical block for the FWSEC section
      gpu: nova-core: vbios: use let-else in Vbios::new
      gpu: nova-core: vbios: remove unnecessary fields in PciRomHeader
      gpu: nova-core: vbios: drop unused image wrappers
      gpu: nova-core: vbios: drop redundant TryFrom import
      gpu: nova-core: vbios: move constants and functions to be associated
      gpu: nova-core: vbios: remove unused rom_header field

 Documentation/gpu/nova/core/vbios.rst |   2 +-
 drivers/gpu/nova-core/vbios.rs        | 701 +++++++++++++---------------------
 2 files changed, 268 insertions(+), 435 deletions(-)
---
base-commit: 8bfe9d72cf2064f679c4192dba84be79eb70675d
change-id: 20260409-fix-vbios-d668e9c21d23

Best regards,
--  
Eliot Courtney <ecourtney@nvidia.com>

