\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Allegro"
    r8 a''16 g f8 e d c b a
    g f e d cis cis' d e
    f4. e8 d8. c16 h8 a
    gis h e d cis cis d e
    a,4 r r8 d g f
    e e f4. e16 d e4\trill
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Allegro"
    r2 r8 a' b c
    d d, b'16 a g8 e a4 g8
    f g a4. c8 h a
    gis16 fis? \hA gis8 a h e,4 r
    r8 a d c b a g a16 b
    c2 c4.\trill c8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 d'4.^\tutti c8[ b a]
    g[ f e d] cis a'4 g8
    f4 d r8 e[ f] d
    e gis a h e,4 r
    r8 a d c b[ a] g[ a16 b]
    c2~ c4. c8
  }
}

SopranoLyrics = \lyricmode {
  San -- _
  _ ctus, san -- _
  _ ctus, san -- ctus
  De -- us Sa -- ba -- oth,
  Do -- mi -- nus De -- us __
  Sa -- "ba -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    f4.^\tutti e8 d4 r
    r2 r4 a'~
    a8[ g f e] d[ c! h a]
    gis h[ e] d cis cis d e
    a,4 r r8 d g f
    e e f4. e16[ d] e4
  }
}

AltoLyrics = \lyricmode {
  San -- _ ctus,
  san --
  _
  ctus, san -- ctus De -- us Sa -- ba --
  oth, Do -- mi -- nus
  De -- us Sa -- _ "ba -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d,8[^\tutti e f g] a16[ g a8] b[ c]
    d8.[ c16] b[ a b8] e, cis'[ d e]
    a,4 r r r8 a
    h[ c16 \hA h] a8[ gis] a a4 h16 cis
    d4 d, b' c8 d
    g,4 c8[ a] g4. g8
  }
}

TenoreLyrics = \lyricmode {
  San -- _ _
  _ _ ctus, san --
  ctus, san --
  _ _ ctus Do -- mi -- nus
  De -- us, Do -- mi -- nus
  De -- us Sa -- "ba -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 d8[^\tutti e] f4 g8[ a]
    b[ a] g[ b] a[ a,] h[ cis]
    d4 r r2
    e8[ d c! h] a4 r
    d'8[ c] b![ a] g[ f] e d
    c[ c'] a[ f] c4. c8
  }
}

BassoLyrics = \lyricmode {
  San -- _ ctus,
  san -- ctus Do -- mi --
  nus,
  san -- ctus,
  san -- ctus Do -- mi -- nus
  De -- us Sa -- "ba -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Allegro"
    d4.-\tutti e8 f4 g8 a
    b a g b a a, h cis
    d4. e8 f e d f
    e d c h a g'! f e
    d c b a << { g' f e d } \\ { g,4 } >>
    c8 c' a f c2
  }
}

BassFigures = \figuremode {
  r2 <6>8 <5>4.
  <6>8 q q <3> <_+>2
  r <6>8 q <6!> <3>
  <_+> <6!> r <6\\> <_+> <\t> <6> <6\\>
  <_!> <4\+> <6> <6\\> r2
  r2 <4>4 <3>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
