Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306091;
	b=QiFbVzNBQD2ZjhmgAjNbQ+TBN483lqqAA96aWfMqHEb12dIaITBj0zjJbO6JFrOkscwe
	 IjIfXHD3sLCqxVuVrZ98sVr8nfU1BXSouOr6+hl0zfQgD+oaczWSmP2gcImNR8Ou3aBzg
	 S1mJukUMyjjSZZd3msEC9mc0v4BNCj8AmnK8C95h7hgcI8zLBjKcnbSFRzaRDVznKgnAv
	 FF8rlBNhTJtUH5Y6FBWvHesEGLweNnSlYPI6ujJSxCFt8hHXhKvT7wMmOYTXTrDKromkT
	 qNxK82Fk7e6mQfXsbTBbNgDuMu2Tu2rod+sWhYMjdM+FvefOGeiSOWcJK8OuYTKWAKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306091;
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
	bh=cAE+oFW++pj7owtQu8ExMVKBiWR5OjfcEfnGoRkgUnI=;
	b=IRwAcqp6T/z3Gas6XsHdni8J1RxUx2GLSOQcFQBpjgGidd/B9o5u7w4+LdnAFjRvy8lT
	 YKdUvFeO3jNO8SLd1yM8DaPc8bG4i/XZ3tNVuMs4M6wpavXK0JOSjF6ZcLLV1xSx1ALry
	 ZR/ASg7rX0uJKmxfts8AnrlLvkPC0CU0ZEWMuXyJUL0cIKoKjcix6MATiv6qeYo9qkSm5
	 /9l3jpixcJt1SG4Ny7KjCWxGddqcK6a4ynZ2NXvYzjFOVKYvWZQ/k8EeuoMH4cffbSV5n
	 yshh5v8qwmdE6Mn2Xko/cVJnaXBLRxrRP2uwP2c+idFD03j/4VMLbA+YPfD07OvnwGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=umMRhM+w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.52
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E47D60A2616
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E47D60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=umMRhM+w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpAmhZ4LI2A3rLowNq3sdGQ07CThRiM1ygtwsM4wjrt6xw7IwfaZG9SM7OCUTK8UrufEfA2MLDTZOu1/64kuIfoevYkEtIennevbZZdnR/qNFgs6dDvqkSFw6c9hC44is3tJAZKe4wN+1/v9Dl3QGEjAunWmFbJ16KDQlkVn/gHBMsXGG3pcL8KBZOIKP7eZd3Qihvmhb2tDAGhNxi0fsAWsjkng780MAS5jvBfx3phnXhiKXQaa3MWy+FykL/bxRX58mWxOzdZ616OCZ5vk4WhPSGwaqJ2tytnKDSctywQciKbEkB7jINYv7ufi2j+qkcBpiLklHpKx4jbEKJixBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAE+oFW++pj7owtQu8ExMVKBiWR5OjfcEfnGoRkgUnI=;
 b=EtIklpj52ks8yEqJY6MEE7S8vFR10WfCpZDGQ63zzDeAReur3hfDzGYjppgA8H3dWPILP34LWnqJobT6TluAfKbnCKeh3q26JEVpfIAQv/N2AH6TThLbBVOk72S/0arXoR50SdL+nfG08GXlGB/hKEgiBkPPmoccqE3ZB38PamZPoDWTUC39Io1EsiUzL+Iy42trgrQq22YX2LR9czS1ok5GjPAl5f2sHaB8ts/e1M21WUrDsrKAPgyIG/oMqL5NZIMTB2CcHlJSCpR8BOn5uJVVsc7gmh+ForiCDIv/nGXeocCKflGjFEXX+TJp4LrVcOvyDquHbGkb6izAQqofOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAE+oFW++pj7owtQu8ExMVKBiWR5OjfcEfnGoRkgUnI=;
 b=umMRhM+wfiEbJufrg0UDowDU+vRJ0bE1kHVHq+wqsgSXTocJUBiZGSHrrdRp6ndqw6fu9+8cxpCBkeW7ZE7jD19hBQGeq+SzdCEuUwOkx34fQavE6x1oYIO2QA2VI0JJ479UGtceg38ZCOGFzj9uAjtKcLo4fKWNwgtPl/4DstQQJ4kWAmPfiW5UVUbEopX0PtNbvM6giZvdVPe7W2spymn2utJgryOodiGHZ6XCYKD2rRS/Mc6ehZFp984ZN8BLa4ZLgX/g7v8ASxgUKNNLZ0VQQNInTxDeHO4pLHDygjwtJl383X4Z2dLkHL9jEtvj3eX8jubvUVl4iGAK1xHudA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:26 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:20:56 +0900
Subject: [PATCH v3 07/13] gpu: nova-core: falcon: introduce and use
 with_fbif_transcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-7-20d79ebb646f@nvidia.com>
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::16) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SAEPR12MB328447:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c70e278-020c-476d-bdb1-08df3f1460c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|56012099006|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	7mttIE9DYtWTsOUVARhqMkhYdVVPDItevyIQc/Tm73/3HkH3mw0bN3nzDNmpEaY7DAFodtpS5J3uJNcpydrlMDYgHPVo2M90BXXi+R4XYvdBEg3rUP6F1VCDjzYI8l4/dR/SNpFIJdYFjNsmCrUxvGsQBCavFAlZq1Fz48F9p9t3YOiyqwT9izJj7+KRk+Nb/TJ9GYKChGznBX5bNFcpqDmBoVRYSXBXuqJ8r1Hl3YDi7xWhZb4OYKpLfQSKGngmTqDO6G6sMmT9EFfmpuG7kIFrDnp6I07rReqwhIr31pL9BKh/Guxo6skW9JV+78EkejkOIPGQZZlDODFGN2i2RkIt+s1s4AbeWU23Z7k84bhiu3AjdgQKKKybRU5V+rroGSqw0qcuPjT8HpAKLQOG24LGSztCMNCS1VY447unKkIfGI5Askz5q1+MDLVjF4Essa54XDFm+k8JGAOma0TBla511mYEe/hYVRVtn//wZvENm1Wl4a1VN0YnuZ7ghHsF45ssfzCrseDp9FwX5slhfsxkI3nfSeRzzsvPW4JzrVu/EgZacIWNjtkUH514oIjx0J83lsnIvvLBsQD+GHniDNV/2gkFPj44Pdg1RWjniXIR89iDg/YnP9vAzsrR04iD/mTbni+cEZXr1sI1JhlefudYaxVry6qEe7201jPaKh0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUkwRjNYcEF1UDg3aFoxbHg5ZHhvdy83bHV1eERkdWl5Y1pYdEpZVWJRQXN4?=
 =?utf-8?B?YUdSdjFEOUZoWDUzRjhRL25DbVRweFBMWkFESjhuVDNneHRTUS9GOS9MRStt?=
 =?utf-8?B?cSt4ci9rdFQ4VWRnNHJTTWRPK0hpTzcrUmsrY040S091RHA4dEc3SXpQdXFm?=
 =?utf-8?B?MVdqVkg2RWpZcUc0SXUyOVVPNjg3L2xFZW52cHg3ZmZPNDA0M0Y0RW00Y3Yr?=
 =?utf-8?B?enZMeVlGbE9PQTR2aHY0Z0Y3dFh4RUREWDBGUDNJcUpEWWVqc3VwclBQWFdo?=
 =?utf-8?B?bXZWZ2pYU0w0cW9mQnVsZVlHdzgvVWdzTjNuWUpCUzByNkNzV0RwVy96cE5y?=
 =?utf-8?B?czZRUmVIeURiV0VmSlpwc0hicW1ybytINEloWlRxMlcrVCt3SXIyM05sTDhv?=
 =?utf-8?B?VWNFWnlYQVVUWVJuckJYTjEyb2gwL3E1YXN0RnV3THhBUmVsazYzWm56Ry9r?=
 =?utf-8?B?eG1vaUVkMFNxVFBPS0VETU10MWhEaWQyRnhWZm0wdVJjSWd5MDQ2b2ltM2lV?=
 =?utf-8?B?YXIvYzl2M0oyWXdqWVNtN1liNUlRTitpZk5jdkhpd29pcEZEeDlmVGVrNlkr?=
 =?utf-8?B?R3FDTTJNRDR4SHVGNGNkYUQ0ZXhxcEowZUhHd2pGQWZLWmxGbEJYbTJaMFN6?=
 =?utf-8?B?SjNDcm5UZ2ZhUnltYzJhbE45M2xqT3VnZVdBcXRSYUlveDNET1NPaER3S3Fp?=
 =?utf-8?B?RFViQmVlUzBlVEJ3c3dFVXdocXJCbUJoUU9GQUhLcXNxMG5jQ0pHNVJMenkx?=
 =?utf-8?B?QXNmVUxMMTdWcXlwdmVkSnZaenV4dUdzWEJjdGZ5TWhwT3dBZVpmSWMyTVJ4?=
 =?utf-8?B?Q0lNQU1RaUNIc2o1cnlXL3hPVlA3K2ZZN21EbFpmN2c1QVJ3eGhNcWtNOGhM?=
 =?utf-8?B?Z1ExbURxbTRvUDRDbGVzeGhtaitiZjhHQktDcTlTbGlpVjZuRFNvN0JaL3M5?=
 =?utf-8?B?bk1WVDVxLzNjd2Z5dmRVUTNUTzRkandXd0ZCdzlYUzhja2F4Tkd2WDBFR0Zn?=
 =?utf-8?B?UDRMZGlhRnhrS1dKdFZTQU1PS1VZSTdtcnJQK0Jray9oVDkzV3JYRndxQlNl?=
 =?utf-8?B?U1kxbjdDNU1JTGh0V05OU2plL3d5blJrMStrU1ZheVlPRHl0UkpoYXUwa0xT?=
 =?utf-8?B?cTA2TjRlRjE4MkQ3NW5LNWhkV2o3NDB6aG5sN3FHbVdDVUh5OVFkeG5XUU15?=
 =?utf-8?B?bjVEK3ZOclU4Z0dZa0JoZEJOczExaTBwQmJaaHErdkhjVy9GRzlFM2o3MXJw?=
 =?utf-8?B?dHV2VXJ1cUlFMEZXcktpakllQlhJczVLSzY0dXRCSkYrUldQUTFjWG56cU9H?=
 =?utf-8?B?b3g4R3puU2dISnJzV3c2K2xvbGxPRHF3am5Ob09MWWdrYk05TFpvQ3p2dFph?=
 =?utf-8?B?SjZPZVVFT2RIZysyaTE4MTRJS3ZTUFpwcDRaaEF0TVJKMU0xbUhqUmhhT3Vn?=
 =?utf-8?B?WUszMXg0eTM4bzRCWGJhbTA1a0gvYjJFS0o1Vi95U0pUdXVuRlpvWGZaR0Yr?=
 =?utf-8?B?Vi9Na0llSEM1bWk2bXZ0S0R6d09VVFpNZlV1Zk41UW4rQXRMbHJUU1FYOVY3?=
 =?utf-8?B?Z2pMbU5SRHRnVndrdlJlVWM0RWY2QmVYL2NLc1RLV0RpUU1FVjFSeHgyS2ZX?=
 =?utf-8?B?SExCakczaVFzb3dmeG54cm9TY1RDM2Y2aFliTUtESFo2Z2xsTFlpZy9QRWlX?=
 =?utf-8?B?dXN4NlFYL3lScENyUXgvaExheE9NSjJhazMyMU0vNkpZMnFvMVpWTzYzalFS?=
 =?utf-8?B?c1dhL0VnWmxESzhYOHFIT0ptL0lwejIxL2lLUmdhcVZPZDlZVkVNSWcxZk9W?=
 =?utf-8?B?Z29PTHBoQWYrNlFlNGI2c0t0djc5cHBsZUx4VU4rVFJhdWN0VU0yN2xidWpn?=
 =?utf-8?B?cmEwblBoVkdlSUxmL0V1Ykt0ZU5oL2VIbkNBdHY4eXk2Vy8reXpDR3pjNHdj?=
 =?utf-8?B?Q2NQTFFQRzhOT09JVWhsemRLSzRpZUh4bURJbGNVcThBVlEvK3hGMk8wRzJY?=
 =?utf-8?B?QmN6eDhSRm9malByLzhJWW1uaEhJcHN6NmFvQ1VzNDFLcTdyOUduZHpxZ0Ev?=
 =?utf-8?B?NlZmMmI5RzUva0wrYUJkZlNCRkJzRjN6aHdDRUg4a2d1SDVmRW1YMnZJV29j?=
 =?utf-8?B?Zmg2Wk5jVkIyQzhsWW5IZk1rR1Z0LzRXS2Y1eHc5NFR5b2F5aloxWWZ3SGxX?=
 =?utf-8?B?eVo0NXB6cTFydmEzY3FQdnNKamEwdTlHU0ZPZUFIekFabEQvTE5ieGlaSlQw?=
 =?utf-8?B?SDlZRTRmZWFBZCs2dlAyZmV6SHNDdElWdnBqRmg3OXhYdldVL1p6WEJ5TDR2?=
 =?utf-8?B?T0Vub2pzN0lncVFueThyODc3ZWtyN0dQbVh6MEl5cjVIaUxrRzNmNzIzU01J?=
 =?utf-8?Q?T0HHJ0yrGDJD0IYmabjalGJOftjMCBj4NO+IFdyiONoAG?=
X-MS-Exchange-AntiSpam-MessageData-1: 8eFd5UUgxLxaWw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c70e278-020c-476d-bdb1-08df3f1460c0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:26.6123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWc/mDvxcs2yU29MNn5ax03qB5YNmAkMIyN42RFb2Re4KERNTxQIw5bmikqTcMqVuY9wTpDroyKElmJiQNEweA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

From: John Hubbard <jhubbard@nvidia.com>

The generic bootloader programs the FBIF aperture of its context DMA
slot and leaves it set after the bootloader has run. The r000
load-and-execute events will need to do the same with apertures that
GSP-RM chooses, and should not leave them behind.

Add a falcon method that programs an FBIF context DMA slot, runs a
closure, and restores the slot's previous value once the closure has
succeeded, and use it to run the generic bootloader. The slot used by
FWSEC is now restored after FWSEC has halted.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
[acourbot: extract from later patch of the r000 series, convert unneeded
 call to `update` into a `write`, only check the validity of the DMA
 context once.]
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs                  | 30 ++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gen_bootloader.rs | 30 ++++++++++--------------
 2 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index b17a997860ef..c888f29f34ce 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -513,6 +513,36 @@ pub(crate) fn pio_load<F: FalconFirmware<Target = E> + FalconPioLoadable>(
         Ok(())
     }
 
+    /// Programs FBIF context DMA slot `ctx_dma` with the value that `configure` returns, runs `f`,
+    /// and restores the slot once `f` has returned `Ok`.
+    ///
+    /// The slot keeps the programmed value if `f` fails, since a falcon that `f` started and that
+    /// has not halted may still be reading through the aperture.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if `ctx_dma` is not a context DMA slot that the falcon has.
+    ///
+    /// Errors from `f` are propagated as-is.
+    pub(crate) fn with_fbif_transcfg<R>(
+        &self,
+        ctx_dma: u32,
+        configure: impl FnOnce(regs::NV_PFALCON_FBIF_TRANSCFG) -> regs::NV_PFALCON_FBIF_TRANSCFG,
+        f: impl FnOnce() -> Result<R>,
+    ) -> Result<R> {
+        let transcfg =
+            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(ctx_dma)).ok_or(EINVAL)?;
+
+        let saved = self.pfalcon.read(transcfg);
+        self.pfalcon.write(transcfg, configure(saved));
+
+        let result = f()?;
+
+        self.pfalcon.write(transcfg, saved);
+
+        Ok(result)
+    }
+
     /// Perform a DMA write according to `load_offsets` from `dma_obj` into the falcon's
     /// `target_mem`.
     ///
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index 54d9796b4897..751335c97e35 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -7,10 +7,6 @@
 
 use kernel::{
     device,
-    io::{
-        register::Array,
-        Io, //
-    },
     num::{
         Bounded,
         TryIntoBounded, //
@@ -39,8 +35,7 @@
         Tlv,
     },
     gpu::Chipset,
-    num::FromSafeCast,
-    regs, //
+    num::FromSafeCast, //
 };
 
 /// Structure used by the boot-loader to load the rest of the code.
@@ -221,23 +216,22 @@ pub(crate) fn run(
             .try_into_bounded()
             .ok_or(EINVAL)?;
 
-        // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
-        falcon.pfalcon.update(
-            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(dmem_desc.ctx_dma))
-                .ok_or(EINVAL)?,
+        falcon.with_fbif_transcfg(
+            dmem_desc.ctx_dma,
             |v| {
                 v.with_target(target)
                     .with_mem_type(FalconFbifMemType::Physical)
             },
-        );
+            || {
+                falcon.pio_load(&GenericBootloaderLoad {
+                    bootloader: self,
+                    imem_dst_start,
+                    dmem_desc,
+                })?;
 
-        falcon.pio_load(&GenericBootloaderLoad {
-            bootloader: self,
-            imem_dst_start,
-            dmem_desc,
-        })?;
-
-        falcon.boot(Some(mbox0), None)
+                falcon.boot(Some(mbox0), None)
+            },
+        )
     }
 }
 

-- 
2.56.0

