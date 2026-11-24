Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795502908;
	b=RwHq10A72ZulpbYJ4BaNQIEePkAgIPrMABlGJLpmWsd9XS7puWr1D6igpdVf8QVz0JJh
	 Q5v/uo6hH6g6K17JMEniUrrcWXwuJkjqNo5Zk4HnDJLCJgoOXpvHInTGqovjjMVhdRAIy
	 n7JXoRHRSCr61FHGKHoMbfgs5yJXG7rBUcwAMgwMOFDggwspCDT6WHjr+LyFc0CEV16gU
	 sjW0z8ROqDE8NZWQwa7q2Y46Z6BGiqf9r2lvt3ZCJD2+dZgezFbu2Ep3Q9mpWBXejwtOS
	 1KPlXDvSFFdpAWImeV2DHBPldNFKnzgZTHfOJHzId0NyUqiFba8y5vPxp0eIFaY7NiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502908;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=T7YogBFAv+x2UMuoPUTS6eMRtnq8yK621fjj33xYcaI=;
	b=SJ3UQxe2JQaUCHbOpmRk3oEZo38zZL9Okf+5bnOEc0KTfK3Ygy3JKiNLLTwzpuKn06I2
	 HRwxqkJ6OzCwjJywbH0nZ3EH3xMKGPq0wHR8KPdrJZ+9+6DZt3x1gKR/jht7cIyz1JZj5
	 dfiGBa0MEbuaPUXEsh3LvHGjudjz4G5wvHlRzu+kolXytrqKnnYt5lvExqU1dHatommCx
	 G+K9AVijMmwTTz8x1HDZ4PfHD9T90PxQQRamp+6tlOG09zX7yLVBEAVjtGrxYbFDnuBUW
	 C8GpqSAjz3bzeFJ1kBW4SB7UqzZzm756gfWlj/3PLzl3/Q3gA+Hh4qDSBzaWPO9aWKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rd2WukLw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.67
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013067.outbound.protection.outlook.com [40.93.196.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7B9606A31E
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 06:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE7B9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rd2WukLw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVBSBY8uuy946xZ3u+I+y/bh8xG+p1BKPfMb1YoCIn323t1jRWDYrNyZejamQBlX0YZn3aehUeoP4s8K8NaHqRRoxN8zMVXY2w7RiziZBZ1NdkF+HxIhXX+bX8Mk93RumQDYxcBJFZvSbJD1MaaCCcqQrmlrPgN9eapIRMf2yndEDsWA73iO1NIhRmBg0EzUIh6xh2EiEFrC7GV2XH9rDNaYYr+Z+4AU/srSk4AdYQZBaThbWWXemn2qDC6elQYEk6ggtrnmmN8sotlkKnYEINFQZ4JQXPkwINWs1tjnTV4/AeWIiFaKsT9ecMbp1hzYkcuQH7+KEQTK6S7RJm/rBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7YogBFAv+x2UMuoPUTS6eMRtnq8yK621fjj33xYcaI=;
 b=PVxCJGuadlCQi+joiwHAD+X/uW0KxIGv8u+KZMieuEhlvI/LHtXtL+z4dF4mbuXHI0WrQbDNDhnE9YUb5M3FhuBw70r+lR2AaRybLkkYyBkbW3mogCOOdSHaJiAmsSAHRhfNEEqlHZYZueKJQor5wpjtkTrU4cLGpI1UVcC/WEBvXqh7uUz8F6si5n0Y51gngC+GDyNumV3aB9RxqR1SAwEBgrMulgmGqpV3886AlrIx04O2GzMdSXWHo+I6E6Y5Rj30yVktfyTWlCKI9gmKjJ3EYf4+bpkKG8vcZqnOy2bibsGcWIMxuay0fc/c/1pfkPu63u8i4/6fJfF/AgA/dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7YogBFAv+x2UMuoPUTS6eMRtnq8yK621fjj33xYcaI=;
 b=rd2WukLw0KuXGJqsOOg0/vp1blC5LZ555ck8itfLUFPY3R9QOxYpRcJuOKCV1kO50r2fqpVlTCwl5/M0z+xEo3n/dxuiALA8BL0OeKi8B6elkAmaw9PCwp4TsaulVvKbGBtjlaf/K+WfKWib9ANhgorFWlR7ABvxKqbnlZMW/qk1L651E4xMEh3tV+GHOahaD+GbV7W0ZwNap8RdLogjQ5RacaOd8d+D64Tk4gJYDy0qIVkBDmDDANN4iTFJa8Dj2s6t/0sM5HU8/NPvQk6j50eHiD/fPZXBrULO4A9O+F0eh1mZ0/FMH1Ksa96qLHr3zWo2l+FIhVoFlD1+FxpQiQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.14; Tue, 24 Nov 2026 06:48:23 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:48:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 15:48:19 +0900
Message-Id: <DN38NOUGQZJA.WRLJHU4M2TWY@nvidia.com>
Subject: Re: [PATCH v3 2/7] gpu: nova-core: read GSP heap variables from TLV
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261121002847.3358679-1-ttabi@nvidia.com>
 <20261121002847.3358679-3-ttabi@nvidia.com>
In-Reply-To: <20261121002847.3358679-3-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP301CA0038.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::13) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SA0PR12MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: 78dc7ac2-c1e0-43be-e665-08df49f6eee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10070799003|18002099003|22082099003|261009223027099003|3023799007|261021121427099003|261021123027099003|261022105027099003|261102123227099003|261026121527099003|261026140227099003|261022115727099003|261022075727099003|261028144727099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	iBVNnQy3XN3C9V37sYfZyLARVZdpo6wylN3fOiST4cxsx5iXmExYyVXG1SAB9WnnV4Q0uBphg9q412HKP9qAjOLPrWqO7W+sHD/Q4rWHtGvwrI3Ab6gUn1EQMuFA2mnSwzjjnLhKcK9fzqtXGYL9Sgs+9Y6bB9H3M9l97oYHZukoAddnfOSIal0Xq2LkvEItN8bKFeAmTLRV+B2nGy0fUbVIe5adGMW/DrMM+O8xjJFSfX1gOLuikG0BM5e2kx5h4ABqQWC6tVy50TVnRAo+IM1c74u8vr7sNDC+e7dVyKNnO8ROBOKhcqjH0rNQWurIAcy3Hht5oLHsZpsE63umsC1GdlHx8MMItH/PNhIUNQQMtIYEg3RE6cdrZSqAo43X7Vj5wfX801G6OLDCE2lhdNfh2XOCKk9NxXSXXuuCKNYJUtEb1smG+z8927+yX721Lfi0PQDF4A+15SsVBSLxGfYCAPf4LGqdWHGppfoJ1i8UeGxXO4UyEmg1wymwOHeypQ8NiPOgnzN7YmMtkzMGloqr3BobuPeu1Nu8e8jIQMPHI/F9IVrFeGIc3wlt2LvOVGQx1oSEWzfwbrPiqJJxkZ7ju+F9JWTr/nWY90fjUn7Gz3J2bjqvwSTyn61NCU4zAgCYmpCiWhdzRMyxc4jAyD/j8MMp06ie3RA7ljJgQIA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10070799003)(18002099003)(22082099003)(261009223027099003)(3023799007)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022115727099003)(261022075727099003)(261028144727099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTlyaVVhZCtrSE1IOFJsRzhTV2ZKaDgwS1N0MGQ4M0tUdUFKL0hCSGNQdytD?=
 =?utf-8?B?akp5dGE1M3MyYUkzTW5MR2ttaWsxeFNOTXk0bGJ3MzQyRFVyWitZZVVGS2dq?=
 =?utf-8?B?VUpUZUFQNzZ0Yy9JeVB2aGFOY1BnQzA2ZFFsOHRHN2FBek9qWUJhamZYYmha?=
 =?utf-8?B?MTFpeFc4Y1U2REN6cjBYa3lVSitEandkeHpqNWtxZHNuYzJka045aFo4K2Qr?=
 =?utf-8?B?WkROMi9tQlphYUNtLy9vcU5uLzFxK1JtMXBNUVhzdEtaYWwwVFJYL0RUSkpM?=
 =?utf-8?B?bTl0dUdzYnFzWk1WcTV4Ukp3S2IzMVJVTFkxUnFsdEc2bXNQYXBDRnFvQlp3?=
 =?utf-8?B?TUF5SG1rTWtGK2E0bGluQzZMbitmaUUxbWtrZStQN2lNbUpsRlJ2SjRDZ2RO?=
 =?utf-8?B?RE9OejdIa0JVR2xtYlFQMjNQMll2clRtbUZLZFVtZ3JvdFBDTjlTUXV2cUNB?=
 =?utf-8?B?N05jYloycWVhSFNtVkZPMXlXQVVqTjJQZkZ1QkZYYmFmenFHRnpHZWpJUm95?=
 =?utf-8?B?TWNlQ3BJdTVNVGZXM1IwUG1uUGIvT0xxdytxeEU3bkkzRUsxT04rRnppSHYy?=
 =?utf-8?B?YU9QcWJnUlBSaFVrdUwxWWlOSVlvUVI1cEl2RHVBUVNEVzE1N1BXTVRpSld5?=
 =?utf-8?B?T3JFVUo0Y25qYnl0Zm9mb09YaHVVQzlCTU5jdmlSYlBkclR2SDhXSXFka29w?=
 =?utf-8?B?WTUxcVNLWnRhTHZtZVlTS3hZeGRMME1zd1hnbHhPQ3lsR3FuYUwvM1BLTHNF?=
 =?utf-8?B?cUZuOFppNk1Jdm43UEw1aWsvZHNzSWs3OFU4T1VVamNzMS9mT0xCRUtONXV1?=
 =?utf-8?B?QXRNZFhja2taS0ZMak9ON1gxUlBWenI3dEZxaG5ic2tOeko1ZFJGNXdOU0tm?=
 =?utf-8?B?VVlUS3YrcjdDZDA3VDVyczBuVWM2aGJoYVpnTXBnMldraUdNNkJPeEVYM2Ro?=
 =?utf-8?B?M3FjZ0ZmNXA5dHFrSUUzMTcxR210VC9PalZTU1hab3JSYjhCZzAvcFRBRExT?=
 =?utf-8?B?QStFbFBUQ0Y4dC9BU3FBZWdpbUlZYXRtUndFR3BIbFhQdEtqRVFEbWZPTFRN?=
 =?utf-8?B?aVFrbGU2TEUvM0RPakd6a0hHUk1TcjdlakZjK3I5RlNJQjdkK0JOcXJLblRO?=
 =?utf-8?B?VmNPZldsM3dBRm10L3FDODRhOHJSYjZjZWg0UlI3ZFJzNzBDZTRKbDd6UVNG?=
 =?utf-8?B?d3JTTnlIQ1ZraS9rVDdkTzV4T1laV0VMam9oNWZPVUFSMEIrM1h3NEVLYlIr?=
 =?utf-8?B?TnBHUmx3Um1DVnk0aXBuYkJoZXFBVEFSY1h3aWNJYVlWU1JtcnNmeHpyQkk0?=
 =?utf-8?B?MWlremVNbFNZZWE5QStHdElkbVNTdUZPVmV2SGlYMXNtNVlEOWVrOG5Ba0dR?=
 =?utf-8?B?Rm1YZWZiVUlWUWxDQ2Z1NmRCVXBmSEJwZW1ZdlJja0JIWDNTdngzeXFVbXN2?=
 =?utf-8?B?N3pLU0FMNWEwZW5lOHB4a0JWM2J5UnYwczF3RDdVdkxPNHpSZ1NVeWwzNHZu?=
 =?utf-8?B?Tk1FSm14V0dXMUxCcS9IUlRVM0xEVTUxbWdzYTF0UW9DZUJsMWFiQnJFdWcz?=
 =?utf-8?B?R1cveGl2dlVXMDVqOFpuVUhUd0RLbzI2TDdvSkhtaG9GbVpjSGpJTEZWbnIr?=
 =?utf-8?B?ZkFTcWY5MjRGdzAxVkNHRHlPNDNjWDFRWTRIajRid1JtVmYzZ1hKRHROaTVN?=
 =?utf-8?B?ZWNnaDArWUNRUHBBV3hlK3BNSGVUcUR5L1pldklIQ1diTjhrTENabkE0MWk1?=
 =?utf-8?B?V1JVSko0T0NXZThhZ2FOOFBPSlNHcXFGVlRGcTJ4aWxMcnRWVmZST2pWNmp0?=
 =?utf-8?B?Nm9RSVBDRndpU2VJRWp5QzdTVkJkY0ZXcENPNXNCZkRNODRsRGlKR0pXNm4x?=
 =?utf-8?B?K0oyV2xpUHJ2T2N2ek4vcjdFQ2NoVnZJa29Id0VtS09qTTZPUWlrQmoxQlhm?=
 =?utf-8?B?S1hYNmlSTGU5LzNROXJad2xZSHVZNjRBbXNsenVXQ0NKeCsrV2c1R2ZKU2R2?=
 =?utf-8?B?OTd3WWhyUmxoWThnUGNtQXE2Zmk5RGlLSTcxUkxrUFArbTBqUFhBZG9ZRGRW?=
 =?utf-8?B?bkZUd0xML2NGNk9DcHBRRWdpallDTlZlUmVKR0xrNlhGSlVtSTFjY3p5TXU5?=
 =?utf-8?B?cG0yQWh6MXNPeU1YbGYveUVaWUdLakUyWEFyci9LK1ExL2NvYjNiUGtWL0ZB?=
 =?utf-8?B?cXJUS0R0dFkwNGRGa2ZpY2EycWk3ZVpOdnpPdHd0SUsycWVvTngxRktGQlBT?=
 =?utf-8?B?YmZJemtuQnBkLzBjWkNHaDZ2Y0E5Yy8xSDlxRUVVZUJzYjd1ZHFlZmorNUhU?=
 =?utf-8?B?dDNNRzNFdHRuVTg3UjZrRUQ1VWh6elR4dVN1NEExMWtmYU8rWU0xQVB2dVpV?=
 =?utf-8?Q?JymNj4iGooV/1PnQHE5A+0ZKU8i1fLlP2lRgOXvHsi5Pi?=
X-MS-Exchange-AntiSpam-MessageData-1: RXkgdFdQLkqPsg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78dc7ac2-c1e0-43be-e665-08df49f6eee0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:48:22.9783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJMJxRVEYosYxs1+6ji7AACfEFTKZ1WsqEBWXopP0LMuB4mK+3xncSALTLGKQWEmvG8oG0FvnTh7IWz2u6KqHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461

On Sat Nov 21, 2026 at 9:28 AM JST, Timur Tabi wrote:
> Update Nova-core to read and store the new heap size variables from
> gsp.tlv in a GspFwHeapParams struct, which is changed from an enum.
> Also provide a constructor (currently unused) to create a GspFwHeapParams
> object from the TLV.
>
> GSP-RM firmware TLVs (specifically gsp.tlv) that are based on r615 and
> later contain an additional six variables that contain values used
> to specify various heap sizes that GSP-RM needs in order to boot.
> These values are specific to each GPU and RM version, and are obtained
> by scraping them from the OpenRM source tree, just like every other
> TLV variable.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/tlv.rs |  1 -
>  drivers/gpu/nova-core/gsp/fw.rs       | 33 ++++++++++++++++++++++++---
>  2 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-cor=
e/firmware/tlv.rs
> index 6a9b318454c4..024b456a0a85 100644
> --- a/drivers/gpu/nova-core/firmware/tlv.rs
> +++ b/drivers/gpu/nova-core/firmware/tlv.rs
> @@ -258,7 +258,6 @@ pub(crate) fn load_file(
>      }
> =20
>      /// Return a u64, from either a 32-bit or 64-bit little-endian tag.
> -    #[expect(unused)]
>      pub(crate) fn get_u64(&self, tag: &[u8; 4]) -> Result<u64> {
>          let value =3D self.find(tag)?.value;
> =20
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index c396daf06f1e..a44550b70d44 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -37,7 +37,8 @@
>      },
>      firmware::{
>          bindata::UcodesImage,
> -        gsp::GspFirmware, //
> +        gsp::GspFirmware,
> +        tlv::Tlv, //
>      },
>      gpu::{
>          Architecture,
> @@ -65,8 +66,21 @@
>  /// build-time constant, so the driver chooses it, and this constant is =
the one copy.
>  pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =3D GSP_PAGE_SIZE=
 * 16;
> =20
> -/// Empty type to group methods related to heap parameters for running t=
he GSP firmware.
> -enum GspFwHeapParams {}
> +/// Heap memory requirements and constraints for booting GSP-RM.
> +pub(crate) struct GspFwHeapParams {
> +    #[expect(unused)]
> +    tlv_gsp_fw_heap_base_size: u64,
> +    #[expect(unused)]
> +    tlv_gsp_hw_heap_size_per_gb: u64,
> +    #[expect(unused)]
> +    tlv_gsp_fw_heap_base_size_vgpu: u64,
> +    #[expect(unused)]
> +    tlv_gsp_fw_heap_size_per_vm: u64,
> +    #[expect(unused)]
> +    tlv_pmu_reserved_size: u32,
> +    #[expect(unused)]
> +    tlv_non_wpr_heap_size: u64,
> +}

I would still drop the tlv_ and tlv_gsp_ prefixes here and go with what I
suggested on the last series:

```
wpr2_heap_base_size
wpr2_heap_size_per_gib
vgpu_wpr2_heap_base_size
vgpu_wpr2_heap_size_per_vf
pmu_reserved_size
non_wpr_heap_size
```

I don't think it matters to the code that uses this to notate each
variable with where it came from (conceptually, these could come from
somewhere other than TLV and still be used), plus the `from_tlv`
function already shows where they come from. So I don't see the utility
in coupling the provenance with the semantic meaning of the vars here.

w.r.t. naming, like you said, maybe later we store some calculated value
here, plus e.g. pmu_reserved_size is already not heap related afaict, so
a better name for the struct might be e.g. GspFbParams.
