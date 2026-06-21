\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Tempo giusto"
    r8 g' b d~ d g fis d
    es d es d g f es4~
    es8 d c4 d f,8\p g
    f d r4 r r8 d'\f
    g f4 e8 f c4 d8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Tempo giusto"
    r8 d g a b8. b16 a8 fis
    g a b a r b c4~
    c8 b4 a8 b4 d,8\p es
    d b r4 r8 f'\f b4~
    b8 a g c a a4 h8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \tempoMarkup "Tempo giusto" \autoBeamOff
    b'4.^\tutti d8 b8. b16 a4
    r2 r8 b es4
    es8 d c4 d8 b4 b8
    b4 b, r8 f' b4~
    b8 a g4 a r
  }
}

SopranoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus
  Do -- _
  mi -- no me -- o: Se -- de,
  se -- de a dex --
  tris me -- is,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \tempoMarkup "Tempo giusto" \autoBeamOff
    g'4.^\tutti a8 g8. g16 fis4
    r r8 d g[ f] g g
    f2 f4 r
    r8 f4 g8 f d r d
    g f f[ e] f4 r
  }
}

AltoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus
  Do -- _ mi -- no
  me -- o:
  Se -- de, se -- de a
  dex -- tris me -- is,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \tempoMarkup "Tempo giusto" \autoBeamOff
    d4.^\tutti d8 d8. d16 d4
    r2 r4 c~
    c16 c b8 b[ a] b4 r
    r8 d4 es8 d b r b
    c c c4 c8 f[ es!] d
  }
}

TenoreLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus
  Do --
  mi -- no me -- o:
  Se -- de, se -- de a
  dex -- tris me -- is, do -- nec
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Tempo giusto" \autoBeamOff
    g'4.^\tutti fis8 g8. g16 d4
    r2 r4 r8 c'
    a b f4 b, r
    r8 b'4 b8 b b, r g'
    e f c4 f, r
  }
}

BassoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus
  Do --
  mi -- no me -- o:
  Se -- de, se -- de a
  dex -- tris me -- is,
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Tempo giusto"
    g8-\tutti g' g fis g g, d'4
    r8 fis g f es d c c'
    a b f f, b4 r
    r8 b'4 b8 b b, r g'
    e f c4 f,8 \clef tenor f''[ es d]
  }
}

BassFigures = \figuremode {
  r2. <_+>4
  r8 <6> <6-> <6> q2
  <6 5>4 <4>8 <3> r2
  r8 <3>4 <6 4>8 <5 3>2
  <6 5>4 <4>8 <_!>4. <\t>8 <6!>
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
