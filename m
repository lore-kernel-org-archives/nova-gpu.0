Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.93.196.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793664197;
	b=iGKEAGOmjpVjVikyOd2GaexhwcIyfF4uhvJNN88vbpjQbdSre1AJFyPUqbL4gI0IhynJ
	 XVVnx4CRmoFRHXpbAgxVCq0ex1CggghFWVLZck5+ld3Hd1P76Ngb6zHFdH1eLmR56onb/
	 9kpKc4siyBmDKXgzNUoMkG6VLs7BPYkn2yXyYrZTswcf1TDzXd7BWuVSZOM7v8jsrbQvy
	 1j0rwJbraFpFn3p/FzNiOA4GLCinCdQE7/ZB03bjOn72KibbXRb2dPNzsG9hIx3kjmf/1
	 S+SA0E22PjubF8PBCGCe69E38pu0D8ivc1E4MIB76BvwIPnvgv61dotHoqB0t9bQrzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664197;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9KtwSB8PAVK85n3h5X2cXIGZusjl/FIy7qBg0z8tWfk=;
	b=HzRpMG9Jn2ycWtaCtm7S11hYtm0og45XFxNYDxB3F6IGXOGquFXv1Vuo/pJ3xq+Bsy7J
	 bIh+Dqjtpv3txP4L0pgxLyYsX7R5cPU1wh1M/tLX4rUiOdO0VAu9gn7z0nBo5n53JjJIS
	 uKzpGF/DvRGC1O5D8VDJqSOwqTnuSEN/9ZUjpe63nlhA8IKQUDKlOF0k4CXyih+PSdSVX
	 LH1sU202NQBFw9IndKjbjP2ZHw81c47rsdmwV2KGapCZFu3gxRWrs7DO5k2s1EsPcTdd4
	 vV8jVok7CbypbXU+p/WSa13cYSoCfwp2pOimvygNGHCbzQoTuOLIPG9Acnhumq6EHbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e6DFctiA;
	arc=fail smtp.remote-ip=40.93.196.41
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013041.outbound.protection.outlook.com [40.93.196.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E03606A326
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 00:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E03606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e6DFctiA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GastBxJHvxDWlDcRrE5MMPQ1JRmV4YvTKdBYABFjwm0X9cLAh9TcpcambhJrRs56bAT6Y5Z5S/6JTlcVAYfXCkS1PfYS0R1YerWIzHYLJbyyzHP//nclWr60F7C01C4wjtstVzet3tgtrGA7x314XTsNaF+dkelwKPJ1s8OUoZFyEM6DPJUvZ/UPfQt37p4sR9v9vjdzNLANBK9tJTAgYIxosAwpqzjCn9CrMFul5ZpuhKE71Go3L4yiFFgwh/dxhNme001RsDeoBxFkS3DeM3t+hh14iBYPZHDPCkNu/B7eRcI6RQpDXrDJAY5UQPJfXdzx94wFjuR5VPdP0DGOrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KtwSB8PAVK85n3h5X2cXIGZusjl/FIy7qBg0z8tWfk=;
 b=jaT3YXPVIeC3jK5yJJ3ZtbD3Q5t1o/2Q8pkhJZ0me+JSJcQ/nqQGQvxDlmit8CcI3DsypKxUBHR/kcK2UDF/MlL3poxwoXWHUE5vlxnMAwzspgbfPFmRcg6WlA4q/wU5Ik4G4WnS39W3cik2GQnV8tMsGgMsqnOmi6brXpIr+HN/wZvM/aunhUcnjgvs8gMahiQwu5jRdQ16zvEdTCx3x2riqG7hXgzk4qmBFbptC+wqP+MTzzHLoyU/+Ez8uS55S3Pzfs/cE6E+p28R5rqonzJVnK0plqyOudRBKuEcb9sXUcJfY8r6i54c+JktnR+glqpQyuBPkg0zRbzaobLUJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KtwSB8PAVK85n3h5X2cXIGZusjl/FIy7qBg0z8tWfk=;
 b=e6DFctiA2F+qhoNfKPP0O3d/cbLSV2Z0FHoeyq8BvUQUWPZX6ilgVh9+5J1E75nzdFwJUu3g4jWZ3HtK+SLnd/EmMgntwE0s2wDmeJQwBZbLxcu+5oaolbtJC9XDxJPQTUqrto6P5MnjbpsKtEf+X/PlphKyTLKTIr8m+wChf/F6pmL1IZSKy1qUEpyYhrh4C0vQDn951McTT3aG0kZT+jtOi9AwoXBYuFEE5z0TIwQQi0T4+sXAgbZI4Fm3De4oH7TMjiWZYpopaVSyvq+IqlToLBwPANDdTFxEaWY38Ldf+GNHLzttCpTE345W6avFEMe4qsAkCI22IidlR/92ZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by DM3PR12MB9415.namprd12.prod.outlook.com (2603:10b6:8:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 00:03:10 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 00:03:10 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 03 Nov 2026 09:02:53 +0900
Subject: [PATCH 3/4] gpu: nova-core: gsp: cmdq: add the GMC send path
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-r000_rebase_on_cmdq-rpc-v1-3-189f9ff3bfd2@nvidia.com>
References: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
In-Reply-To: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0358.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::9) To PH7PR12MB6858.namprd12.prod.outlook.com
 (2603:10b6:510:1b4::20)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: 199e209b-c8fa-481c-13ae-08df393dd8d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10070799003|6133799003|10067099003|22082099003|261102123227099003|18002099003|3023799007|56012099006|11063799006|5023799004|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261021123027099003|261022075727099003|261022113327099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	thAlZ7FIRzW+oJBmx/bBcb8RRCJgQB7p7xkxzJA3sTijYgWZcmDE70+8W75ol7sbz1AlfwTTvRD9Td+TPf/5jOfUhXNkTKz/3LZKkqvoFx2rZnj0UL4yiIhybLdjiMh0PAsAsd6H8wkJPFHR4IVuN9pUW22HrNGQTe7GVCavxdJQrAFq1xZTpuD0zeVvw05/w4Lx+Yp6cAXgTupnLPgmiH8PXSSNMNHKVYQSuUTw8UR/70iL1fSPkazI01NYRA/FcU2mWXzVbewSUcj2lStpVwzjwHahqODBUVv/2yDWn0iNyCN6662RGFJNtyZzgDBU6RMafZzr+MrycaTbQ11pBehmF+1KFDHyw1biL4X98WSjvLcrevNMGJBnxmvlLLV8d6SCYQv9ILQH6+wazQ5XbfUktIxLIFVTsWuZd3Xbkrn+xikHgS/+vcADoLntnQwzdVUG7fbXeqmG9wqSIu1qpqvGniz5P7L4aWEKhP39jCyqYGaOmrVNTOvcn7g7nBYrabDH+4PcCqKV6oL/0UyqkmjaCj6exLV+4Yb7ypnif1DV3BRfD4Zi5iZthQF7ueISHpwvZcSSA3jTGeqKHSgdCEtuOrImtdyanLrnX9AjbyFFDFEdaA4fgMtzwBlKZCv2WHW0GHHmlFSBPqK/N+5xdXENRhWfEASwSVGaxsgb2wI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10070799003)(6133799003)(10067099003)(22082099003)(261102123227099003)(18002099003)(3023799007)(56012099006)(11063799006)(5023799004)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022075727099003)(261022113327099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXhSbWJCTndUdkxjWVRHVVRzak9walZZanFQNjYrc1ZGN3pQeUpMRW0zNEVp?=
 =?utf-8?B?ckkzSnJYUHpTYW9RTUVQclpMb29Fa3VkR1FvZURkZHJJR3VLQVVvNCtBT3k5?=
 =?utf-8?B?dm1vUnJuZC9zSTB2eWhZUnZ5ZFN5cTJBUTVOOEtIR3JHMUR4UFRPQVZBS1BZ?=
 =?utf-8?B?WnhpN1BlekJ5dThHWmZyMEFRUC8wQkJEbUViZ0NDWWJNMVF1L29MUVJVYWZu?=
 =?utf-8?B?RTluZWFYUDUrSUYvNHBhMGQxYXlITkxnVmtjL3l0RDNTMWFLOHQzQ2RVMlgx?=
 =?utf-8?B?aC9UQUhmQTFCVUpmNXBvQU02Ly82ZjZiOCtEOWgveVlMRHFYekpROGh0T2Zt?=
 =?utf-8?B?RVhiWjBjMkpYcm16dzJHZ2xSd3hpRTVTdGdPZTRNd05zWE5GSEhySXFERzdI?=
 =?utf-8?B?L01kZGkvL0lMUk5oQkttaGRNWE9ac2xMa1M1dFJ4MlptL2NPSlhOWWlMTFkx?=
 =?utf-8?B?dkVCUjFyR0NJSjl0d29aMFFmeWVSMGUxR0FaelBZdDRPa0lpMjkyVHovQmlO?=
 =?utf-8?B?dU9CcjVzNTVoMCtDM2VLV0N2anV5V3hXWTJ4WXQ5ZFpkbU9xcTJNaVB5N2Fl?=
 =?utf-8?B?YlhCanZCeFkvUFlnTHYzZEg3WFFPTzJSUmE1UzlsaURwUDNLZG5paFJjZEdv?=
 =?utf-8?B?Y0w0enlhTEpBdnpDV2F1TFdrUDZmV2lRbGpuUk5aMU14bzF3aUcvM1BIdGU4?=
 =?utf-8?B?eVVnd0doNUdVQTlIelorTEE5U0Z3allaNGdBT1NDT0dwS1N4NGM3WWpLODVX?=
 =?utf-8?B?a1dTRlRPTm5iNnoyNDdBcTRvQ0VYcWp5NlNQOVhEcVNJZzlXc3V0VTZNd1Ro?=
 =?utf-8?B?YUN3MHVTc3RWeWRwSmQ2YWdya1dVZ0xQdHBIaThpaFhQNVZPY0p5Z3lIUHBk?=
 =?utf-8?B?amZQV0Fpc2xPcU5KTkl6cy9KS0xoVms4dWM1ZDZwVzFvTWJuL3V5bnUxVmVt?=
 =?utf-8?B?MktxQnRiUUZxeTJJZE85a1JkMzZoTktWMHRIS0VZOHpSNVZKbHRTbklEamht?=
 =?utf-8?B?WDZwQW5CNzN5NnBDQm1wd2gvbW8vRlpFSWNvM2Z4c0plcHFmazZvN1d6QXJm?=
 =?utf-8?B?QjRsWXdEN1RuTk0xWXBHRWhsSGNzWCtRdlZEQmUyOGNHZVdyTE9BcHhPdk5k?=
 =?utf-8?B?UDMyMkZWbThFU1FFbzhKWFJKR0VLclJZaXp0cXZMZjhsdkdKVFoyZkVuZzl0?=
 =?utf-8?B?blF6bDlTeDVLdG5HeXZibERJdFpQdEd4ZXI4YitMZ2dFbGs2OGdtZFRwbDJz?=
 =?utf-8?B?ZWZWWmExdUdzMktCTVZUM2YxWGJTRU9PSUZLb3ZxK1dXL1htbHdFRzZ3aW9j?=
 =?utf-8?B?Q0IxMUlJMnJWb05Mb1JyV0xwcEtab1prL2RlNXpndlVlQXV0V0Y5ZThCK3Nv?=
 =?utf-8?B?UGR0QzdSWUxyTUswV2V1MFJta1JaSVBrd3Y3ZVdSZ2JnakQ5ZGZSL2ZtTkh2?=
 =?utf-8?B?cTYrbkJMYkowUlRXejVLRHpxL3lmSHlKYjhvYkxOemVQVGNVK0MxQ0VteHJB?=
 =?utf-8?B?bm1IVnhYUGs4UTZMVE10bUNYZWkwc1lJa2J1RTZOUDU3c0RDZzgwNmRIMlVF?=
 =?utf-8?B?ekpJVGllVzJTS1d3TzlpcFlhZjU0S3R5aVU2QWR0end2ZmttVURVRS9SVll1?=
 =?utf-8?B?VGlzeU90cmUyRkFVY01kM1hRSEhKZE5GNmhOMHRkcmliQ1d1K0lGZ21GazJm?=
 =?utf-8?B?bERwMEczdi9iVUJiTGVSVW4xb3dPOGNKRWIwaEkxMHI3eHMrVW9laDREcG41?=
 =?utf-8?B?a2lEcUpHTjJ6QXFpQ0tGT2dBb1B0dVB1S0t2YitpeEJMd1ZuN2xLekx6eUlO?=
 =?utf-8?B?Y1lQM3BRY3VHc1I4eUc1dzJiTWRGSmRtUWFSVCtDYytXOGFhQ0phLytiMHJT?=
 =?utf-8?B?U2dLS3dZVFdWL24vdkxVekJJTm9iU3FEUnJ2TnQ0RkFBRmpsakJ5NFRQL2tn?=
 =?utf-8?B?N3cyOGNLaXRXYnpIOXNnNW5TblZ1N1RtR2txdGVlUWU4aXVja0U1QjJWVFZk?=
 =?utf-8?B?OWg1cnowRDhxWWp6SWUzb2dNaVFEbUZLZXF2b3ovVGJYOTdTLzFRTSs3Qzlh?=
 =?utf-8?B?cDdseUh5NU5FNjBVNW1vM1g0K2cxNjdtalYvVzNqOXU2bU1DbHJ6Zk96Y05U?=
 =?utf-8?B?ZGVTK1QzMnB5d0RTRTNuNHJIS0U1S3BzQ1BBVHZxWEQwbWJ1a0RyQ2tDUEdO?=
 =?utf-8?B?cFFUdnBCclZ0UUVGOXhPaVRFYndGZkhxMDE1Ri9ta1lhZ084endVU0FRamsw?=
 =?utf-8?B?NGlRclk5ckhsUjB3RS9nVHlEMkpnWEZiblJ3NzRGN3ByWS9Wd3NrRmp3bURI?=
 =?utf-8?B?UHBKWWRCOXJJcXhqUVYzZUZJZ0Z2Ykticmd0bDVHUTJMZDR0VXlsdVExS3Bl?=
 =?utf-8?Q?3RrxWrUrLdVTPXt7RieODbEbeekEFRj8cLyByLe5AvmQG?=
X-MS-Exchange-AntiSpam-MessageData-1: oRmEY9cXwjRoJA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199e209b-c8fa-481c-13ae-08df393dd8d8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6858.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 00:03:10.5020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDmRu2374XvMZWoHLjNE+8k7o7LDDVWnlW0BRMjtGGyldjejXpinDXYv2n6X9Ub6tzbE/7qvGrQ+/B0+yfjA/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415

From: John Hubbard <jhubbard@nvidia.com>

The r000 boot protocol has the driver send GSP_INIT, the request that
carries the driver's configuration to GSP-RM, as a GMC (GPU Management
Controller) API command. GMC and RPC commands share the command queue
and its sequence counter. A GMC command always fits in one element, as
the GMC API has no continuation records.

Add the gmc sub-module of the command queue, sibling of rpc, traits and
types definitions mirroring those of rpc and adding support for GMC messages.

The module has no user yet, and is built as dead code until the switch
to r000.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     |   4 +
 drivers/gpu/nova-core/gsp/cmdq/gmc.rs | 194 ++++++++++++++++++++++++++++++++++
 2 files changed, 198 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index c8b103a0785d..629ab8d35f87 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -1,6 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
+// The transport header of the r570 firmware carries no message type, so nothing can produce or
+// consume a GMC message before the switch to r000. Until then the module is built as dead code.
+#[expect(dead_code)]
+pub(super) mod gmc;
 pub(super) mod rpc;
 
 use core::mem;
diff --git a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
new file mode 100644
index 000000000000..b035f30479a8
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Support for the GMC (GPU Management Controller) API message type on the GSP command queue.
+
+use kernel::{
+    device,
+    prelude::*,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
+};
+
+use crate::{
+    gsp::{
+        cmdq::{
+            GspCommand,
+            NoReply, //
+        },
+        fw::{
+            GmcApiHeader,
+            GmcCommandId, //
+        },
+    },
+    sbuffer::SBufferIter,
+};
+
+use super::{
+    Cmdq,
+    CmdqInner,
+    CommandElement, //
+};
+
+/// Trait implemented by types representing a GMC command to send to the GSP.
+///
+/// The main purpose of this trait is to provide [`Cmdq`] with the information it needs to send
+/// a given command.
+///
+/// [`CommandToGsp::init`] in particular is responsible for initializing the command directly
+/// into the space reserved for it in the command queue buffer.
+///
+/// Some commands may be followed by a variable-length payload. For these, the
+/// [`CommandToGsp::variable_payload_len`] and [`CommandToGsp::init_variable_payload`] need to be
+/// defined as well.
+pub(crate) trait CommandToGsp {
+    /// Id identifying this command to the GSP.
+    const COMMAND: GmcCommandId;
+
+    /// Type generated by [`CommandToGsp::init`], to be written into the command queue buffer right
+    /// after the GMC API header.
+    type Command: FromBytes + AsBytes;
+
+    /// Type of the reply expected from the GSP, or [`NoReply`] for commands that don't have a
+    /// reply.
+    type Reply;
+
+    /// Largest reply this command accepts, in bytes. Zero for commands that the GSP does not
+    /// answer.
+    const MAX_REPLY_SIZE: u32;
+
+    /// Error type returned by [`CommandToGsp::init`].
+    type InitError;
+
+    /// In-place command initializer responsible for filling the command in the command queue
+    /// buffer.
+    fn init(&self) -> impl Init<Self::Command, Self::InitError>;
+
+    /// Size of the variable-length payload following the command structure generated by
+    /// [`CommandToGsp::init`].
+    ///
+    /// Most commands don't have a variable-length payload, so this is zero by default.
+    fn variable_payload_len(&self) -> usize {
+        0
+    }
+
+    /// Method initializing the variable-length payload.
+    ///
+    /// The command buffer is circular, which means that we may need to jump back to its beginning
+    /// while in the middle of a command. For this reason, the variable-length payload is
+    /// initialized using a [`SBufferIter`].
+    ///
+    /// This method will receive a buffer of the length returned by
+    /// [`CommandToGsp::variable_payload_len`], and must write every single byte of it. Leaving
+    /// unwritten space will lead to an error.
+    ///
+    /// Most commands don't have a variable-length payload, so this does nothing by default.
+    fn init_variable_payload(
+        &self,
+        _dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        Ok(())
+    }
+
+    /// Total size of the command (including its variable-length payload) without the GMC API
+    /// header, i.e. the payload size advertised by that header.
+    fn size(&self) -> usize {
+        size_of::<Self::Command>() + self.variable_payload_len()
+    }
+}
+
+/// Wrapper type for sending a GMC command as a command queue element.
+struct GmcCommandElement<C>(C);
+
+impl<C> CommandElement for GmcCommandElement<C>
+where
+    C: CommandToGsp,
+    Error: From<C::InitError>,
+{
+    fn size(&self) -> usize {
+        size_of::<GmcApiHeader>() + self.0.size()
+    }
+
+    fn write(&self, dev: &device::Device, seq: u32, dst: &mut GspCommand<'_>) -> Result {
+        let command = &self.0;
+        let payload_size = command.size();
+        // Extract the areas for the GMC API header and the command itself. The GSP message
+        // header, the GMC API header and the command header together are guaranteed to fit
+        // entirely into a single page, so it's ok to only look at `dst.contents.0` here.
+        let (header, contents) = GmcApiHeader::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
+        let (cmd, payload_1) = C::Command::from_bytes_mut_prefix(contents).ok_or(EIO)?;
+        let header_init =
+            GmcApiHeader::init(C::COMMAND, u64::from(seq), payload_size, C::MAX_REPLY_SIZE);
+        // SAFETY: `header` is a valid reference, and is not touched if the initializer fails.
+        unsafe {
+            pin_init::raw_try_init(core::ptr::from_mut(header), header_init)?;
+        }
+        // SAFETY: `cmd` is a valid reference, and is not touched if the initializer fails.
+        unsafe {
+            pin_init::raw_try_init(core::ptr::from_mut(cmd), command.init())?;
+        }
+
+        // Fill the variable-length payload, which may be empty.
+        let mut sbuffer = SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
+        command.init_variable_payload(&mut sbuffer)?;
+
+        if !sbuffer.is_empty() {
+            return Err(EIO);
+        }
+
+        dev_dbg!(
+            dev,
+            "GSP GMC: send: seq# {}, command={:?}, length=0x{:x}\n",
+            seq,
+            C::COMMAND,
+            payload_size,
+        );
+
+        Ok(())
+    }
+}
+
+impl Cmdq<'_> {
+    /// Sends `command` to the GSP without waiting for a reply.
+    ///
+    /// # Errors
+    ///
+    /// - `EMSGSIZE` if the command does not fit in a single command queue element.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializer are propagated as-is.
+    pub(crate) fn send_gmc_command_no_wait<C>(&self, command: C) -> Result
+    where
+        C: CommandToGsp<Reply = NoReply>,
+        Error: From<C::InitError>,
+    {
+        self.inner.lock().send_gmc_command(command).map(|_| ())
+    }
+}
+
+impl CmdqInner<'_> {
+    /// Sends `command` to the GSP, and returns the sequence number of its element.
+    ///
+    /// Unlike RPC commands, GMC commands are never split: a command that does not fit in a single
+    /// element is an error.
+    ///
+    /// # Errors
+    ///
+    /// - `EMSGSIZE` if the command does not fit in a single command queue element.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializer are propagated as-is.
+    fn send_gmc_command<C>(&mut self, command: C) -> Result<u32>
+    where
+        C: CommandToGsp,
+        Error: From<C::InitError>,
+    {
+        self.send_command_element(GmcCommandElement(command))
+    }
+}

-- 
2.56.0

