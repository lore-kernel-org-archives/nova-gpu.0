Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9B732B121
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 23:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789772895; cv=fail; b=WsX+kTZOryayjYkQ1Dk/RHc3+BmTH3iPUkxZKlM/9FID38aHaA2NML1Nrfd2oiCGbIBDySvTogLJvq4nitqSSF0bnv4ORj3VYrIXRA4gcde6+cLJF1+LfEuUGsMbRdbju9XzCoDoxmT8LS6phx8toL6WUj6zUOTRko40sc7X9QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789772895; c=relaxed/simple;
	bh=Ow1oiUCo/5HfDYlUZRCmiL1dkXMHZrTsBuFQDFQRK+Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pxU8PvGHtdbzgV15fF1pU1jjvScfGxBLpVjg9sUa+RGNF50c070bXMp73T/p6sHD1Hbrtsw7IKhM3PVO4vcRiCbCx/4QY4bvzM4EkKmrZsWuvBr4A/UaYDByMG/hoRB7KAY3JXyeIZtlAA7i1v5CBrq+/fy14Sm7hzPg4ugueKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gVE7dsb5; arc=fail smtp.client-ip=40.107.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gVE7dsb5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIGKrPK6KqLxuLuJ51PFsInvZswaEe0pR9g6SRzdGquLKFmOuFhMvHXeYGW5D9Qo3jhHC7VefOsA0IObCCfMdAb+8auqxST9/pjA7FgoY0ttMwMQ5avMwOgmLmGHHJTNK0QKiBa1R2jZkjz5UIcnA3PhPJuZll3+v0HfH/zpQvSbY5Qii53P0jzAgLmZZZg9XGz+XEdrIQHpSv7FNX4i/9klYR7ScFJcHFzddhK+oHFBnMVweICyaIw87vFnU0ocw5kq/zUeL9b2wk45vcGXJDtbHAMnS8az60dAl/916zp4+ypZ/4r/T8eYhQFjA1d9E3StPmGl1U76Uy+M/qsO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow1oiUCo/5HfDYlUZRCmiL1dkXMHZrTsBuFQDFQRK+Q=;
 b=QjL5LC8cwhljlmssCs9FyOdCM9YJuk5eOwAYL5U3aIw13HErk6/VPTMeqXXOfLn6bdkwIYfeGVsZzdgUBY9a4YAJaX3DPQDNvhrh7CFZUU9CbwictCpyx4onlZqw8LuEaMbEDLwsIgUYuA3Q0t2aEgNL8SLrGj2lPlqqjkrJHod+rBV2+xiVCCLSM+AokWI3pDlQg+sOrIeP0a7tqBO7DCTXcc3AIRxr5etGJwE+0ryDxgHHYPN4bQj+jOHkTlCfbwR1vNia+VRpnrNdgGG8xAx5sPsQ+qbneFSIjDex50v2+wxuYGXr14vvvBEelTQZnwul7UrREp3yEQfjDmRrVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow1oiUCo/5HfDYlUZRCmiL1dkXMHZrTsBuFQDFQRK+Q=;
 b=gVE7dsb56SkvCtJgjxzM8jTIckRr4/9wL94uSkbV5VBtSlSCs0SVGVO9l0TRxSKBJdIsfaVZpW9ttEEr1HaigPVVg1pbXbmcHLofhems1iNVoRzxpnHp5IgTqJX6r4O6rDtLM9tcquriosQWVeOECB1PYzEbyHEVoithkT9zq2Z65PSZLcW+U8jbIe6VivrxrJO1I8A+ySxYst0omV5xV32dCXGu2TCfAbnN4LbFnbhugEmxvjrKhu6YVnsQR0uiP3MZhkq/HZcPd6bINTO1d9kfh3D8YsjiGdNEXTGhA5EnQGJDkDI2flgw0nrVfI54AWo6sXgASdhDpJSUgaGhug==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SJ0PR12MB6688.namprd12.prod.outlook.com (2603:10b6:a03:47d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 23:08:09 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 23:08:09 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "lossin@kernel.org" <lossin@kernel.org>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi
 Wang <zhiw@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
	<ecourtney@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple
	<apopple@nvidia.com>
Subject: Re: [PATCH v3 00/33] gpu: nova-core: boot on the r000 GSP firmware
Thread-Topic: [PATCH v3 00/33] gpu: nova-core: boot on the r000 GSP firmware
Thread-Index: AQHdRwoSipp91kFLAUu8/o+Umsn3H7bU9w4A
Date: Fri, 18 Sep 2026 23:08:09 +0000
Message-ID: <5e63e3635251247d2b93134939e839f3ce5824f8.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SJ0PR12MB6688:EE_
x-ms-office365-filtering-correlation-id: becac9d2-4afa-4b1f-da05-08df15d9b4f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10067099003|11063799006|22082099003|56012099006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 OB91pePhCjLpW7hn4PhHj5sOSNKTzxYrk89udyBywUEYpeGbD+/CG763LXgK7grAKVL0avSRMKvz/0RnFoi8xi/qt1NB7x2OXHZdm6Xr69j5hkRN3wHnI90H89IpcBL4NiYhZ6G82iX7a8a9hvU3GqQaNBpiSsLrtltlPNIDk7OuaM7D+QuS65Qm8RRSLcMgWCuySPDZBcgagojWcWB1vaUIvkKsGxmhbk9fIzVMJkH+kVwIDystWPYIrpv0zArWdwbn6At1VWXZKuDZ4iJUv43ZCgUg7c3zXtKGC9f1giHnAaNc/7N3KNjHz9hb5YMkvdUIi7Cu06Uv65kHiQs9SHq0Dyx8FsV/43DuWchLBgDgXZVWZlIBZEaMRrqU/LTSSBs5edF+xsWp/2pvrgVD0oiLPGiqmowRmPHotzLrBQMHYAhtrB5UZAPEhT6U2JQHKc6QJl+KwGmAE+uCIQbU1iUalSCqbh8mAEiurbwb9mMZF05999igGuxRsrzQiqXqHLoRGf4MLx5rNrbPvZmt/NFk3q6wTU+QHTp3szQdvuLUFoWO5m3TV5Dmnywobc/BvfQI1uvVYzlIRe9PUjQ+cK0CikQ5oj/WkN5YGsF4pam2/2PqEHhwhastFUgbyMPAtirxVTqnp1FdwmX5SSwS/DEoB5ny11Hrbe8HYytIPO47XQ5zfd9dH47GziEGo9g6plAAG/wntc/qiMvzFhMNcQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10067099003)(11063799006)(22082099003)(56012099006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1lzQlArR2RQbUl3ei9HQ3dVb2k3cUtVcTI2ay9nbDdIb2tyOUQ4b0xNNmJs?=
 =?utf-8?B?QmdXbjZNbXVQTVBoU2F3RVM4RTUzSU41bko4V3ZHQzBiSTI1blB2YW9uWE9E?=
 =?utf-8?B?WnVKQjV5dTNEckp0NWMxbFJ4ZFZxL0l1ZDI1WllrRnNyQXNUT25BVUtOWmNk?=
 =?utf-8?B?ekYvUVl3WEJUWHlpeGE5engzL3p3TldacUZRN0RDQlpvL1prcWtOVGNzNkJ5?=
 =?utf-8?B?OGlDbUc3N0xFakFycUpBbFRlbFJqckVJaXp0Y01QenBiWlFnZ0VpSHJtakxH?=
 =?utf-8?B?OWVBeVVzTWZIU1B6emxsTTNRVi9ZcCsva3ZFU3RvUWVobXM0TnVIRDFLVGxS?=
 =?utf-8?B?cndnY01QemdYdGJqbDAxU3lQZVRDYlg1bG1QNnMyUkw4aG1qWHk1SUE4SlV6?=
 =?utf-8?B?RGk0OHRkYXZ4NGJQSUh4cHpwTmRlL0ZLa2p1Ly9jcW1SaEoyd090WERBTS9w?=
 =?utf-8?B?cTJnWGdnZ09TL2Z0MG5yTnBmc3gzWXJuWXQyRzJWR0k4emlPTEFXTDZoM2JF?=
 =?utf-8?B?bmwxVzQ4RngyeEp2Z3Y0MG5IRFp1My9lKy9rUkh2dzJvb3NDeTFNQTdmQ1lz?=
 =?utf-8?B?ZW84bkluQ0hRcG82YnRDNUY5cDNKblRGMFVSK1d4ZzRCTnMzUXZEY2hYbVNj?=
 =?utf-8?B?ZWorSDFQMXFMSTUwQTl1RFpqODRjNHNzY1RSTEJvWXlzKzFyYy9XV0J5Ulhr?=
 =?utf-8?B?N0t2YVowMVhTdVJoc1c4ajFCSEd0eE5qQ0RadFRZbmU3ektwbmJYcml6eWR1?=
 =?utf-8?B?VmFZUXB4bTBiN0MwUCtsUUpieXZkMGthMS9zdVIzdDVnTVpyUHluYi9YQlgx?=
 =?utf-8?B?bEZQVUJrWGI5SXlEYXVaYWVSdjRZaEFwUUxNMHdlTjVIQlQ0a2FDQ2xhWTdS?=
 =?utf-8?B?UDZOTytXZ3hpR1Zzd0NMSU5KWEI1K1AvaUNmV1VBcHpQeG5vSk1qTDZtV1Qw?=
 =?utf-8?B?UlZsaE1aYUVvekRWb1VzRGNESGJUZDg2bGNiVTVVRWUzcEtyb3RsdXNaRjNn?=
 =?utf-8?B?T1g3WE5vMmZTc0tDQ2g3TTJKYlNON214b0hzOGxRSTF1bStZQ2NVckpXM0Vl?=
 =?utf-8?B?eGtFY0crdkF5Y29ETDYwcURTSEFCTFpTaktkMnowVjRnS0xhRm41YXlpOEN2?=
 =?utf-8?B?OGliL1pyZ1dMVkFmNDVlUnpsdVN0Vi91Ujd3eVNQSWpheGxIVlBrUmNsVUR2?=
 =?utf-8?B?WnhGNm1TUkVrK3B4UEJxYkFuUFh1UjJYOHR3ajJSNE83Vk52R1R5VndaSE4z?=
 =?utf-8?B?dElVL1pycmR5Y0paYnpkQmJDbFNHUU41eS9RTEhuQVNocFNmYmRNeG5FSno0?=
 =?utf-8?B?b2ZPQ0lnY3JwY3owNG9qcHFHMkFPVXpMdXJLUWFzRWxicHE0NTZCdWV6L3Rj?=
 =?utf-8?B?UGZENkFUTjFJNEI2TEpCRS9lMko5dTFiN1R5RytvbkFSS21JVEJzTERRTzZ0?=
 =?utf-8?B?L1lZMlF4bWwwL3hpaXBvemN3N05GQ3dvcUpmRjhvaWQya1ZCVTBjNXpMSm5O?=
 =?utf-8?B?dmV5dXd4NjZJNXd6Zy9Fc25rbUdaQ1NtWEcrdTF4bHJaUTdvQnh3SVR3QWd3?=
 =?utf-8?B?Ry9lalRiZ29jZUJ5ZG5IYlRpVnF0Rmpua3lML3pudmxpdTZpWVhlTWVCMS8v?=
 =?utf-8?B?RlY2OUNSSm5Zb3pzT1A1YVhtUlo4OWl2L2pwcmh1cUQwVGl5VC8vaXoxeWdt?=
 =?utf-8?B?c2NOSkRDZHZKaUw4SFdaY2RNbzk2ZmZ3cjgxMzB0RENRZUs5MEE0dTJDazY2?=
 =?utf-8?B?bkJvMXk2RzltYjJmQjVZWkVReUNyV1VtTFczV3EwcDIzL2puMmdjSzNaZGtx?=
 =?utf-8?B?c2VpNlFvWUFxTEh3cmltRVUwaVRReWNuWlZVYVc4dndybzFUN0xaRE9qNWhZ?=
 =?utf-8?B?MHdhN1NDTmdNQUNadzJTMVc3WXIxSm1TRGJueTlNUS9Bcnl6bkxJbWhzbDBz?=
 =?utf-8?B?Z1lneHQ3UWxLNXYwS05YV0tJU2FzODlrWHd4SGZUVUs1QmJua3o4bHhCM0lX?=
 =?utf-8?B?NDd4cS9pKzRPUUJmZFowSDlDUzhvRm5IMktuNldHOHRvRC9YL1F4eVVjbitM?=
 =?utf-8?B?aG0yRDBhL213eENzbGVjRGhYWmFybThjU1ZBSTA4a2E0cGM1OUtjWEdZdlBD?=
 =?utf-8?B?Z2wwWS9uUmUwdUJTUlpoSmxvOG80LzN5cUpROS9UaWIva21yTlBrdVlCNUtP?=
 =?utf-8?B?dDE2SVVIRVlFSzRCVlhVQUQ4V1RYNUZ0NHNKdUx5cHliT3I2VmRXYTh2K3Bs?=
 =?utf-8?B?cjQydis5aktQMTNYeVBrRG5FdW0rTVNibThVN1E5ZEw2Y1FBbFJoTVpGUGRw?=
 =?utf-8?B?M1gzanZoSTdJeEkwTFpGcE1KMTd6bnQ1dkk5eWpiQ3MyN0Mzcm1kZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CB0ADD833DFCC48B66127A7786CF69C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: becac9d2-4afa-4b1f-da05-08df15d9b4f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 23:08:09.7821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J00lI9yY2gYLvtOKBIzezWW/kRzzk/RerdXtlzCVAT7rx01Hn1K88/auEBeOpge4fq/0FHZWrDma6b5g86Kf9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6688

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE4OjA2IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IFRoaXMgc2VyaWVzIG1vdmVzIG5vdmEtY29yZSBmcm9tIHRoZSByNTcwIEdTUCAoR1BVIFN5c3Rl
bSBQcm9jZXNzb3IpDQo+IGZpcm13YXJlIG9udG8gdGhlIEFCSSB0aGF0IHRoZSByNjE1IGFuZCBs
YXRlciBmaXJtd2FyZSByZWxlYXNlcyBzaGFyZS4NCj4gVGhlIGRyaXZlciBjYWxscyB0aGF0IEFC
SSAicjAwMCIsIGJlY2F1c2UgdGhlIGZpcm13YXJlIGZpbGVzIGNhcnJ5IG5vDQo+IHZlcnNpb24g
bnVtYmVyIGluIHRoZWlyIG5hbWVzLg0KPiANCg0KSSB0b29rIGFub3RoZXIgbG9vayBhdCB0aGlz
IHBhdGNoc2V0IG1hZGUgYSBmZXcgbWlub3IgY29tbWVudHMuICBTbyBGV0lXOg0KDQpSZXZpZXdl
ZC1ieTogVGltdXIgVGFiaSA8dHRhYmlAbnZpZGlhLmNvbT4NCg0KSSB3aWxsIHRlc3QgaXQgbmV4
dCB3ZWVrLg0K
