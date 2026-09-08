Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013058.outbound.protection.outlook.com [40.93.201.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7169439FCCD
	for <nova-gpu@lists.linux.dev>; Tue,  8 Sep 2026 07:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853907; cv=fail; b=nGpmzMrNqGdpquNoGrBE2VPXq62dUQLDTrR/L+JNx9XFZkWukWDFjJIvhbA8khve6ajuWuy5ULNO6CGBT/ORxOPOF6Y1HzQ35RVeCv8jZlQ3RG/nK0Qs5LMhDh2meujpRwH2bs4X7C2uvqhAzJYrW6Yo3J3EDOy4oaEWv1lPKAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853907; c=relaxed/simple;
	bh=QxWef9I0GjEU1FkEDbtDrlKF/nKH7lluzKEI1Dvyj2Q=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=h58jFnRVtO2gEka4YqaRfU0mzvpT6FJVdI1bZ2RDW/pXLqOUt3heSIDjXaL9C5IunrYUrK2iv12ly/GGYgsAfkEGufkKrPkRe/Q9f504of0/BCFGU2Me4dHvW9SSwT4GFJKLvXG00TCrcChF695ejQSAlH/a9xuY4mhf9RP+sl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b58/grHe; arc=fail smtp.client-ip=40.93.201.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b58/grHe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+tZzFFyGQKRx1DCITgLON3hK5+rCydCWsxLGcOUZgKZJuOFTmzYD5SWCqbhAEIm00o7obmihvsrlAptPZBlyLxun/uWTYD9RGH39X2vPrGMsb8FfVee+cDewRgHEIoNLlhWyQRbDrkv0PLLxKnnl0RwnKC+xRI4dDY0pmOQA2I+gZKBdT/BJCLOci4Ss6+DQYzd0+HybVKxMl6swHgVaXbqeBzzlkfTXmTHxzXt8p8eZg/gi0euU7XmGN264vtYZEa1n9x4nYGNyTy5MRUSI6fXr6BO45eWn0rympjUj2E374Rn1m6gUx1MITWR5/bbX8Rpj7Mxk9aStvaMJ6KFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kjausy80i2Bl8T1O+V1MZwnRbmX1OlaDmKWz+evPnBo=;
 b=m9MQIH5gveaZWcsFZ89GUi0HTbYqSb1PUcSyriL94mK2t12bttqecowbhax/H3WrPwpYibU9KJcIGdMAMaTlpZ/GskwAZQ3SgMWlyuyFkWEj4wrhQmgQD1/lhI9XYTVOl1affLQlgGgIyumNS/LDEZ1QQGmXCftQo2/oFhCowK5q4CQcBc3QTMHRjyBK0nULN2p6u/dqknJUn4T6lj0uq++9x6sEczWVvh5DDnmS5mB4dQcJMYwoRjOfB88mu2PF3hMAIcL4PR8mv3TiOts1ma6motvMfwQhSJOaKbCj0gE3LY2Qv9jz3brWXJSxET6RHnN8pMg+gTC1BWfogXrX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kjausy80i2Bl8T1O+V1MZwnRbmX1OlaDmKWz+evPnBo=;
 b=b58/grHeft2jYDycStIPpdMQ6mdhf7WnMXe1h3YErDvf8G/Kknr4a/1cAowDLuqbynycfUh9rjWm3xwI9CcI+jFh06YOu/GU9sOuEtU8DPhcMjaqLNxkeVkqEV6rvGq32RMrW4TdL7uFUfcjYBsgl0dvSDB/4lvDOjQWNV7qUU+yJ4+SRroWgB3EHrI1P0eqSl9VfvvQ/zZScAxN8GTf3pznAUk/abpA/rEwD0X1ywQpk7cQVmXF18kLTwOTy3JRxmoTdbVCMa741fSD4XC8Q7ZKXB5HpGTEiO+5O6ysj3Q1msNOPb5qzk+giw6NsfxvY+lW+AWplZnt70hNunpyaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 07:51:41 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 07:51:41 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 08 Sep 2026 16:50:30 +0900
Subject: [PATCH] rust: maple_tree: implement Send and Sync for MapleTree
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-maple-tree-send-sync-v1-1-43adcd4a16e8@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJW4kEr2JclPYXhmAlHTQSw
 t2tuvwW722kyAKlc7VRxktUHqnAHioKg089WGIxOeNOpjUN3/08gZcMsCJF1jUF9rZu2mh9dzS
 OSjpn3OT9216uf+uzGxGW74v2/QP7lWSjeAAAAA==
X-Change-ID: 20260907-maple-tree-send-sync-a1479d1ab302
To: "Liam R. Howlett" <liam@infradead.org>, 
 Alice Ryhl <aliceryhl@google.com>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Joel Fernandes <joelagnelf@nvidia.com>, Gary Guo <gary@garyguo.net>, 
 Boqun Feng <boqun@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0301.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::17) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|LV5PR12MB9754:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ebe83d8-16e9-40a0-c652-08df0d7e04e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|7416014|376014|10067099003|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	3LalcnaPlrS2tb/Rv131m4UlaXKRW/75z8QNh2MIfW5iDn9C232MfKygh+fNhMOloWw/uTOOKkqzLIp+6sP5x5ArpvGjGSFbmDzUyVfEF2A5sEvsFPyldhC8dcegXEOf3TcRYaX5cCKPHv8VBw7Ge4iji8wmpxBXP6n0km4YuGo5i/KwnKx47G+Ms8agDNgI7IAYEZUWpimlb26SBH30RWbnVSxedLGdYjRoe6V7CfFfH1HoW8XJel/nE3eBazRSGwWngUBw/4NP1ByIAbY2rXRgxDYoBjsIfcaaqgsFBHdPgXW/FnaJMnKz3kIWdciHVaAFhTWrRydrQ8IUkXjO343+csETERc0U3eTGnw7Sb4tI+FoQ0yLLQnky3VXbvyVXtnQwSykcCE7lkeD5SCh6PVYQD0qE63X+K04YhYtHoi2LaUJH2yusPYCFSwWAltEZAUy3h3zNRxV1MCvmM3PYMnFL8BTyUD7n1h9rajmSOajR9XgyaRbMcXm5nJtVMCwdbJVZb/bkghSe2mbilBCOXoMg1Mf+dHOkF1UCe/E/qZZ15/PJCmoqDHwA029eRh9VRlKNb+RtJUioi5QQMGSPJNxpiFFq/2i7NVn6QBiz7uGbVF/FzccU+38AblPDS3bqZn6nDBNr7Fuqmnw1BUr17AsSYL5sdTCgygMXA/is68=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(7416014)(376014)(10067099003)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3ZpTTAvQzFSamlkQWxVSXVRMUxZaGpzbzJyUzVCWEswNHBLZ1pWNkpncjNY?=
 =?utf-8?B?NjBLditMUlBGU3k3VDZ3cjl2SDJFZmw2SEsycE1aMWllK1Z5bWpNKzNpYmRB?=
 =?utf-8?B?KzZNU3pZWXJuajBDdlNHVWYxN1ZVRlNVM0s4TTJUcFlJUWdtbnhzYjVJR2ov?=
 =?utf-8?B?cVV1Y2wwVnArU3RLODFoMlgyZE05U2NFR1dRYTNjeGdDMGtxbHMzVWNNU0FV?=
 =?utf-8?B?dnV0SmtWU3VXNlA0alAwWXJEZnFZMmFVdFd0eStWRUtEc21QYUpLSmpCY0dB?=
 =?utf-8?B?bnYzQjZhTTJlNEZUUFl6a3hDbURTTHFlakgwRU0zekg3UjdoOUdDcHJWZTRU?=
 =?utf-8?B?Qjl4cnpTbG5tSzNYSUVsWW5Ra3M3VVcrVTBOcFhrR3JlRUttUWdCODNRY1Uy?=
 =?utf-8?B?RVRaQktzOENkc3VUUmM1ZXk3K3VkRWhSdUdzTzBmYTdSczVFdjZadithaDdt?=
 =?utf-8?B?WnJJaDg2ZXhtbHZVbi9Wbmh6dXJTR0U2VzlYMGhnT2ZmMGNsbzJBMHpnK0xr?=
 =?utf-8?B?Q3ZuNGc4bEZCbHhoc1ZXL2R6OHY0SXBDQ01zN2Y0TzZ0L0MwM3pnMDFLVlBr?=
 =?utf-8?B?cEp4OEY2WFhwQ0lPSllTOFFtdXJvdlBzNTk0cWJvdklaQ0d1U3J2cXpYaFBj?=
 =?utf-8?B?WTNCNlVTM1NJR29Vd2x3VWlJZG9OMS9pdTBZT1ZHdDZSY1hrZk5FT2w3bHVa?=
 =?utf-8?B?dEZhUjRsa01lVXAvVXI4b20zclRjWWZVcFV3MWIyOGNKVW9WeGtqUmxkNXQz?=
 =?utf-8?B?djZrL1JCWjgxOWpqeVR5Zmc3bEdsL2dqVG9oc2d0THdxMWpoK012SlFMVnZM?=
 =?utf-8?B?SFZiOGhnZ0dJSUFWcGhkV1ZiOVBVcTB5NWx0SitKUVlScWpTU0l4akJTdDNG?=
 =?utf-8?B?ZEJyYmJMRVM4eDVzSEhWSHZZSGp4RWZOSFQ1Wk9DcmdMTHBJOGl5d21aTmR6?=
 =?utf-8?B?MVY2SytaUC9KRzNQS3RRRFBpMmZQdndueG5KMi9jRjd2REF6ZGFMQjRrdUxq?=
 =?utf-8?B?cVVtc3Y5QllBSnJSNUMya2VtbjJBcHVhYUc4K0w0S21VbUVIVUh6WG9TaUd4?=
 =?utf-8?B?eTBTY3BHN1pyS0NFaGpzNkx0VGVCVCtnc0lrUlBWb0FvSWFtNTdQaFd5dWtq?=
 =?utf-8?B?VmZkWlR5a1l4RnFXbVROWGNRMy9kSHZrSzNPc00vVXFPMy9vbWNUdTNZQlZn?=
 =?utf-8?B?QlJZcDRzQnI4R1lWaVB2UGVPQklYMzVZS0RDdlZCQ3BGUGczRk0yNkxjTGE0?=
 =?utf-8?B?cjNUN0NkS053SHU5ZTJhb3lIaEFuRnUrZVkxYzJFcWIwaHdlMzQxZXFnRDVR?=
 =?utf-8?B?Lzg5c2JCcDdDNnFocURtYnhNbHAyV2Uxa0phdmRNS2NNNHpPTWhlVGZ1YTJC?=
 =?utf-8?B?a3VFSU5hRXhiaGVPZ0hZb2ZDTVY5Y2tuZDBVbjZhbmtSSlNqd1lQTVZLYTBV?=
 =?utf-8?B?c0FTdmMvdWZJd1RFZFcwWWlQSTloU0s1TWQzM0IwTVprR0Z0RGhzbDMyT0lx?=
 =?utf-8?B?OFFYM1dCYUtsay9aaGJCZVB2RW40VDBYQmUybTAwd1NkUmFlakVmUlZ0NWRx?=
 =?utf-8?B?WGduUlRBaEkrQk9naTNRVVljNXJ3dUtSTVg1K0JMZXJFOEtFY1B3NnBTOWM2?=
 =?utf-8?B?RlQvWkZZWEVuUnVOcjNta1RkNWdyK21OQmhrTkxrRmdZUkdLa2RYdW9ydjdX?=
 =?utf-8?B?ejNpM1F4SnU1ZGpTQXVtZVM4SlVpZzRzR1VLeU1sbFdKYkw5VkdSanlvZ0NP?=
 =?utf-8?B?N1ZTY09OY2ZjZWNHS0pLRFU2TnV5cWgzVW5EY3BEM0dWSzVFc0xZZkFYa1NB?=
 =?utf-8?B?eTNIQ1VFeEp4MUhrSlkwQ1RscHdBc2pVUFoxNS9mM0dBYStRVjZKWFJobk4v?=
 =?utf-8?B?L3lQZGFJNmc0TTlFZjJ3UEhMcWphVjFQUGtNN3Nqd0FEaTllS0dpaU1PKzJG?=
 =?utf-8?B?QUZlVmVNWXc2TE1sT0xGSWo3VVI3Mngyd3dUREpKSVFaS0E1RTBQR2U2V1B6?=
 =?utf-8?B?aWV6cFEyZ0t1RnNnMEZIZS9pTkpyeFJ0ZklrUmhialAvYmk0Y08yd3dxTE9o?=
 =?utf-8?B?eHgwRGpxNVNyT0ZkWEwwSVBRalNBQUVrSWdtd3BQTnJGR2VPWG9VeXM4cTNS?=
 =?utf-8?B?aEpvUmNXYklmRmR3REd1dWhoRXZ6VkQ4SThTUFpMakZTeklOUU9MWUlQanFJ?=
 =?utf-8?B?SFIxY0tKRjlXOEdJYkVSNDNjb2RFTy9jRkhtUTQ1NVI5TktrYWVpbXdKLzMz?=
 =?utf-8?B?dytkckVSQ3M0YVpLSnhvdVMvdVJ1eEZlSTZpdlpLQlB1ZVA4dDNjNk8rek40?=
 =?utf-8?B?WFRIRTlLYm0zek4vUGlXYklkS2s4Z2dZbUZrWnBMakpWL09kejVpMkRZblpP?=
 =?utf-8?Q?7e1vPb8cpEDe4AWaqdbohyDIOPCKxweYxB0AzQRkG/dSw?=
X-MS-Exchange-AntiSpam-MessageData-1: nSLGo6lx/5JwHg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebe83d8-16e9-40a0-c652-08df0d7e04e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 07:51:41.1295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMDNoNKQs+7MVU2pOxgzr18EEjDRQF8Cst4p9z2OhaKJbXGW6RRK64uvtYnenY3V+2XhTId1oJ2A7Ukob1y2OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9754

From: Joel Fernandes <joelagnelf@nvidia.com>

The C maple_tree struct contains a *mut c_void, which prevents Rust from
auto-deriving Send/Sync. Following is an example error message when using
MapleTree in nova-core's Vmm.

This propagates up through MapleTreeAlloc to Vmm, BarUser, Gpu, and NovaCore,
causing NovaCore to fail the Send bound required by pci::Driver:

  error[E0277]: `*mut c_void` cannot be sent between threads safely
      --> drivers/gpu/nova-core/driver.rs:77:22
       |
  77   | impl pci::Driver for NovaCore {
       |                      ^^^^^^^^ `*mut c_void` cannot be sent between threads safely
       |
       = help: within `MapleTreeAlloc<()>`, the trait `Send` is not implemented for `*mut c_void`
  note: required because it appears within the type `kernel::bindings::maple_tree`
  note: required because it appears within the type `Opaque<kernel::bindings::maple_tree>`
  note: required because it appears within the type `MapleTree<()>`
  note: required because it appears within the type `MapleTreeAlloc<()>`
       = note: required for `Box<MapleTreeAlloc<()>, Kmalloc>` to implement `Send`
  note: required because it appears within the type `core::pin::Pin<Box<MapleTreeAlloc<()>, Kmalloc>>`
  note: required because it appears within the type `Vmm`
  note: required because it appears within the type `BarUser`
  note: required because it appears within the type `Gpu`
  note: required because it appears within the type `NovaCore`
  note: required by a bound in `kernel::pci::Driver`
      --> rust/kernel/pci.rs:294:19

Implement Send and Sync for MapleTree. The tree contains no thread-local
state, and all shared access goes through the internal ma_lock spinlock.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
This is a repost of Joel's v3 [1] with no code changes. The upcoming
nova-core memory management changes depend on it.

Compared to v3, I've added Boqun's Reviewed-by from the v2 thread [2],
which v3 didn't pick up.

This is based on drm-rust-next.

[1] https://lore.kernel.org/all/20260511143604.3848176-1-joelagnelf@nvidia.com/
[2] https://lore.kernel.org/all/aftiZGt3HQe0Bf_x@tardis.local/
---
 rust/kernel/maple_tree.rs | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
index 265d6396a78a..74cfd5c0fb2a 100644
--- a/rust/kernel/maple_tree.rs
+++ b/rust/kernel/maple_tree.rs
@@ -16,7 +16,11 @@
     alloc::Flags,
     error::to_result,
     prelude::*,
-    types::{ForeignOwnable, Opaque},
+    types::{
+        ForeignOwnable,
+        NotThreadSafe,
+        Opaque, //
+    },
 };
 
 /// A maple tree optimized for storing non-overlapping ranges.
@@ -240,7 +244,10 @@ pub fn lock(&self) -> MapleGuard<'_, T> {
         unsafe { bindings::spin_lock(self.ma_lock()) };
 
         // INVARIANT: We just took the spinlock.
-        MapleGuard(self)
+        MapleGuard {
+            tree: self,
+            _not_send: NotThreadSafe,
+        }
     }
 
     #[inline]
@@ -302,19 +309,30 @@ fn drop(mut self: Pin<&mut Self>) {
     }
 }
 
+// SAFETY: `MapleTree<T>` is `Send` if `T` is `Send` because `MapleTree` owns its elements.
+unsafe impl<T: ForeignOwnable + Send> Send for MapleTree<T> {}
+
+// SAFETY: `&MapleTree<T>` never hands out `&T`; all entry access is serialized
+// by `ma_lock` or `&mut Guard`, so `T: Send` suffices (`T: Sync` not required).
+unsafe impl<T: ForeignOwnable + Send> Sync for MapleTree<T> {}
+
 /// A reference to a [`MapleTree`] that owns the inner lock.
 ///
 /// # Invariants
 ///
 /// This guard owns the inner spinlock.
 #[must_use = "if unused, the lock will be immediately unlocked"]
-pub struct MapleGuard<'tree, T: ForeignOwnable>(&'tree MapleTree<T>);
+pub struct MapleGuard<'tree, T: ForeignOwnable> {
+    tree: &'tree MapleTree<T>,
+    // A held spinlock must be released on the same CPU that acquired it.
+    _not_send: NotThreadSafe,
+}
 
 impl<'tree, T: ForeignOwnable> Drop for MapleGuard<'tree, T> {
     #[inline]
     fn drop(&mut self) {
         // SAFETY: By the type invariants, we hold this spinlock.
-        unsafe { bindings::spin_unlock(self.0.ma_lock()) };
+        unsafe { bindings::spin_unlock(self.tree.ma_lock()) };
     }
 }
 
@@ -323,7 +341,7 @@ impl<'tree, T: ForeignOwnable> MapleGuard<'tree, T> {
     pub fn ma_state(&mut self, first: usize, end: usize) -> MaState<'_, T> {
         // SAFETY: The `MaState` borrows this `MapleGuard`, so it can also borrow the `MapleGuard`s
         // read/write permissions to the maple tree.
-        unsafe { MaState::new_raw(self.0, first, end) }
+        unsafe { MaState::new_raw(self.tree, first, end) }
     }
 
     /// Load the value at the given index.
@@ -375,7 +393,7 @@ pub fn ma_state(&mut self, first: usize, end: usize) -> MaState<'_, T> {
     #[inline]
     pub fn load(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
         // SAFETY: `self.tree` contains a valid maple tree.
-        let ret = unsafe { bindings::mtree_load(self.0.tree.get(), index) };
+        let ret = unsafe { bindings::mtree_load(self.tree.tree.get(), index) };
         if ret.is_null() {
             return None;
         }

---
base-commit: e6a2c988ed96a5a3af51ed97ecba980521bf2fc0
change-id: 20260907-maple-tree-send-sync-a1479d1ab302

Best regards,
--  
Eliot Courtney <ecourtney@nvidia.com>

